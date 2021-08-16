#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h>
#include "opencv2/imgproc.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/core.hpp"
#include "opencv2/dnn.hpp"
#include <librealsense2/rs.hpp>
#include <opencv2/cv-helpers.hpp>
#include "time.h"

using namespace cv;
using namespace std;
using namespace cv::dnn;

//DNN
Net net;//DNN net
vector<string> classNamesVec;//class name
const size_t inWidth      = 416;
const size_t inHeight     = 416;
const float WHRatio       = inWidth / (float)inHeight;
const float inScaleFactor = 1/255.f;
const float meanVal       = 127.5;
std::vector<string> outNames;

//모델 변경가능(아직 v5는 x)
std::string yolo_tiny_model ="/home/piai/catkin_ws_d435i/src/ROS_realsense_opencv_tutorial/data/yolov4_best.weights";//yolov4.weights enetb0-coco_final.weights
std::string yolo_tiny_cfg =  "/home/piai/catkin_ws_d435i/src/ROS_realsense_opencv_tutorial/data/yolov4.cfg";//yolov4.cfg enet-coco.cfg
std::string classname_path="/home/piai/catkin_ws_d435i/src/ROS_realsense_opencv_tutorial/data/obj.names";

int main(int argc, char **argv)
{
  ros::init(argc, argv, "ros_realsense_opencv_tutorial");
  ros::NodeHandle nh;

  //이부분 4로 빌드되어야함
  cout << "OpenCV version : " << CV_VERSION << endl;
  cout << "Major version : "  << CV_MAJOR_VERSION << endl;

  rs2::pipeline pipe;
  rs2::config cfg;
  rs2::frameset frames;
  rs2::frame color_frame;
  rs2::align align_to(RS2_STREAM_COLOR);
   //color, depth를 받음
  cfg.enable_stream(RS2_STREAM_COLOR, 640, 480, RS2_FORMAT_BGR8, 30);
  cfg.enable_stream(RS2_STREAM_DEPTH, 640, 480, RS2_FORMAT_Z16, 30);
  pipe.start(cfg);

  for(int i=0; i < 30; i ++)
  {
    frames = pipe.wait_for_frames();
  }

  namedWindow("Display Imagee", WINDOW_AUTOSIZE);

  ros::Rate loop_rate(30);

    // yolo 모델을 읽음, CUDA설정
  net = readNetFromDarknet(yolo_tiny_cfg, yolo_tiny_model);
  net.setPreferableBackend(cv::dnn::DNN_BACKEND_CUDA);
  net.setPreferableTarget(cv::dnn::DNN_TARGET_CUDA);
  outNames = net.getUnconnectedOutLayersNames(); // Layername을 받음
  for (int i = 0; i < outNames.size(); i++) {//Layername 출력
      printf("output layer name : %s\n", outNames[i].c_str());
  }
//  ifstream classNamesFile(classname_path);
//  if (classNamesFile.is_open())
//  {
//      string className = "";
//      while (std::getline(classNamesFile, className))
//          classNamesVec.push_back(className);
//  }


  clock_t start, end;//FPS받을려고 선언했지만 변경해야함
  start = clock();
  while(ros::ok())
  {
    //frame 받음
    frames = pipe.wait_for_frames();
    frames = align_to.process(frames);
    rs2::depth_frame depth = frames.get_depth_frame();
    color_frame = frames.get_color_frame();

    static int last_frame_number = 0;
    if (color_frame.get_frame_number() == last_frame_number) continue;
    last_frame_number = static_cast<int>(color_frame.get_frame_number());

    //Mat으로 변경(image matrix)
    auto depth_mat = depth_frame_to_meters(pipe, depth);
    Mat color_mat(Size(640,480), CV_8UC3, (void*)color_frame.get_data(), Mat::AUTO_STEP);

    //detection
    Mat inputBlob = blobFromImage(color_mat, inScaleFactor, cv::Size(inWidth, inHeight), cv::Scalar(), true, false);
    net.setInput(inputBlob);
    std::vector<Mat> outs;
    net.forward(outs, outNames);

    //FPS받음
    vector<double> layersTimings;
    double freq = getTickFrequency() / 1000;
    double time = net.getPerfProfile(layersTimings) / freq;
    double FPS=1/time;
    ostringstream ss;

    //Detection box를 찾음
    vector<Rect> boxes;
    vector<int> classIds;
    vector<float> confidences;
    for (size_t i = 0; i < outs.size(); ++i) {
        float *data = (float *) outs[i].data;
        for (int j = 0; j < outs[i].rows; ++j, data += outs[i].cols) {
            Mat scores = outs[i].row(j).colRange(5, outs[i].cols);
            Point classIdPoint;
            double confidence;//분류정확도
            minMaxLoc(scores, 0, &confidence, 0, &classIdPoint);
            if (confidence > 0.6) {
                int centerX = (int) (data[0] * color_mat.cols);
                int centerY = (int) (data[1] * color_mat.rows);
                int width = (int) (data[2] * color_mat.cols);
                int height = (int) (data[3] * color_mat.rows);
                int left = centerX - width / 2;
                int top = centerY - height / 2;
                //classid, cofidence, boxes PUSH
                classIds.push_back(classIdPoint.x);
                confidences.push_back((float) confidence);
                boxes.push_back(Rect(left, top, width, height));
            }
        }
    }

    vector<int> indices;
    NMSBoxes(boxes, confidences, 0.5, 0.2, indices);
    for (size_t i = 0; i < indices.size(); ++i) {
        int idx = indices[i];
        Rect box = boxes[idx];
        Rect object = box & Rect(0, 0, depth_mat.cols, depth_mat.rows);
        std::cout << mean(depth_mat(object))[0] << " meters away \r";
        //ALL Detection box distanse print
        rectangle(color_mat, box, Scalar(0, 0, 255), 2, 8, 0);

    }
//    end = clock();
//    double result = (double)(end-start);
    ss << "FPS: " << FPS ;
    putText(color_mat, ss.str(), Point(0, 10), 0, 0.5, Scalar(255, 0, 0));//FPS출력

    //영상 출력
    imshow("Display Image", color_mat);

    if(waitKey(10)==27) break;
    loop_rate.sleep();
    ros::spinOnce();
  }
  return 0;
}

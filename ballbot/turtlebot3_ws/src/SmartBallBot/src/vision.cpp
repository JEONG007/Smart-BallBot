#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h>
#include "opencv2/imgproc.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/core.hpp"
#include "opencv2/dnn.hpp"
#include <image_transport/image_transport.h>
#include <librealsense2/rs.hpp>
#include <opencv2/cv-helpers.hpp>
#include "time.h"
#include "std_msgs/Float32MultiArray.h"
#include <sstream>
#include "std_msgs/MultiArrayLayout.h"
#include "std_msgs/MultiArrayDimension.h"

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
std::string yolo_tiny_model ="/home/posteck/turtlebot3_ws/src/SmartBallBot/data/yolov4_best.weights";//yolov4.weights enetb0-coco_final.weights
std::string yolo_tiny_cfg =  "/home/posteck/turtlebot3_ws/src/SmartBallBot/data/yolov4.cfg";//yolov4.cfg enet-coco.cfg
std::string classname_path="/home/posteck/turtlebot3_ws/src/SmartBallBot/data/obj.name";
//std::string yolov5s = "/home/piai/hustar_ballbot/src/vision/data/last.onnx";

int main(int argc, char **argv)
{
  ros::init(argc, argv, "depthcamera");
  ros::NodeHandle nh;
  image_transport::ImageTransport it(nh);
  image_transport::Publisher pub = it.advertise("depthcamera", 1);
  ros::Publisher detect_pub = nh.advertise<std_msgs::Float32MultiArray>("detect", 100);
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

  namedWindow("Display Image", WINDOW_AUTOSIZE);

  ros::Rate loop_rate(30);

    // yolo 모델을 읽음, CUDA설정
  net = readNetFromDarknet(yolo_tiny_cfg, yolo_tiny_model);
//  net = readNetFromONNX(yolov5s);
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
  auto start = std::chrono::high_resolution_clock::now();
  int frame = 0;
  while(ros::ok())
  {
    frame += 1;
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
    vector<int> Xvalue;
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
                Xvalue.push_back(centerX);
                classIds.push_back(classIdPoint.x);
                confidences.push_back((float) confidence);
                boxes.push_back(Rect(left, top, width, height));
            }
        }
    }

    vector<int> indices;
    NMSBoxes(boxes, confidences, 0.5, 0.2, indices);
    double min=100.0;
    double X=-1.0;
    for (size_t i = 0; i < indices.size(); ++i) {
        int idx = indices[i];
        Rect box = boxes[idx];
        Rect object = box & Rect(0, 0, depth_mat.cols, depth_mat.rows);
        if(min>mean(depth_mat(object))[0]){
                min = mean(depth_mat(object))[0];
                X = Xvalue[idx];
        }
        rectangle(color_mat, box, Scalar(0, 0, 255), 2, 8, 0);

    }
    std_msgs::Float32MultiArray array;
    array.data.clear();
    array.data.push_back(min);
    array.data.push_back(X);

    detect_pub.publish(array);

    std::cout << "close ball Min : "<<min << ", X: "<<X<<" meters away \r";



//    ss << "FPS: " << FPS ;


//    putText(color_mat, ss.str(), Point(0, 10), 0, 0.5, Scalar(255, 0, 0));//FPS출력
    sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", color_mat).toImageMsg();
    //영상 출력
    pub.publish(msg);

    imshow("Display Image", color_mat);
    imshow("Display depth Image", depth_mat);

    if(waitKey(1)>=0) {
//        auto finish = std::chrono::high_resolution_clock::now();
//        std::chrono::duration<double> elapsed = finish - start;
//        ss << "FPS: " << frame / elapsed.count() <<std::endl;
//        putText(color_mat, ss.str(), Point(0, 10), 0, 0.5, Scalar(255, 0, 0));//FPS출력
////        std::cout<<"FPS "<<frame / elapsed.count() <<std::endl;
        break;
    }

    loop_rate.sleep();
    ros::spinOnce();
  }
  return 0;
}

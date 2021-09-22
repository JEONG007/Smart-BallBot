import cv2
import numpy as np
import threading
from time import sleep
import time
import imutils

def tennis_detect(VideoSignal,YOLO_net):
# 웹캠 신호 받기

    # YOLO NETWORK 재구성
    classes = []
    with open("custom/obj.names", "r") as f:
        classes = [line.strip() for line in f.readlines()]
    layer_names = YOLO_net.getLayerNames()
    output_layers = [layer_names[i[0] - 1] for i in YOLO_net.getUnconnectedOutLayers()]
    prev_time = 0
    # FPS = 1

    while(True):
        # 웹캠 프레임
        ret, frame = VideoSignal.read()
        frame = imutils.resize(frame, width=1200, height=1200)
        current_time = time.time()-prev_time
        # if (ret is True) and (current_time > 1./ FPS) :	
        prev_time = time.time()
        if cv2.waitKey(1) > 0 :          
            break
        h, w, c = frame.shape

        # YOLO 입력
        blob = cv2.dnn.blobFromImage(frame, 0.00392, (416, 416), (0, 0, 0),
        True, crop=False)
        YOLO_net.setInput(blob)
        outs = YOLO_net.forward(output_layers)

        class_ids = []
        confidences = []
        boxes = []

        for out in outs:

            for detection in out:

                scores = detection[5:]
                class_id = np.argmax(scores)
                confidence = scores[class_id]

                if confidence > 0.98:
                    # Object detected
                    center_x = int(detection[0] * w)
                    center_y = int(detection[1] * h)
                    dw = int(detection[2] * w)
                    dh = int(detection[3] * h)
                    # Rectangle coordinate
                    x = int(center_x - dw / 2)
                    y = int(center_y - dh / 2)
                    boxes.append([x, y, dw, dh])
                    confidences.append(float(confidence))
                    class_ids.append(class_id)

        indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.45, 0.4)


        for i in range(len(boxes)):
            if i in indexes:
                x, y, w, h = boxes[i]
                label = str(classes[class_ids[i]])
                score = confidences[i]

                # 경계상자와 클래스 정보 이미지에 입력
                cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 0, 255), 5)
                cv2.putText(frame, label, (x, y - 20), cv2.FONT_ITALIC, 0.5, 
                (255, 255, 255), 1)

        cv2.imshow("YOLOv4", frame)
        if cv2.waitKey(10) & 0xFF == ord('q'):
            break

    # When everything done, release the capture
    cap.release()
    cv2.destroyAllWindows()


if __name__ == "__main__":

    # run faceDetact function with thread t1
    global t1
    VideoSignal = cv2.VideoCapture(0)
    # YOLO 가중치 파일과 CFG 파일 로드
    YOLO_net = cv2.dnn.readNet("backup/v4/yolov4_best.weights","cfg/yolov4.cfg")
    YOLO_net.setPreferableBackend(cv2.dnn.DNN_BACKEND_CUDA)
    YOLO_net.setPreferableTarget(cv2.dnn.DNN_TARGET_CUDA)
    t1 = threading.Thread(target=tennis_detect(VideoSignal,YOLO_net))
    t1.daemon = True
    t1.start()

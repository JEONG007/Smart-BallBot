Smart-BallBot
================

Thank you  __TenniBot__ for inspiring this project.  
  
  
　　　　　　　　　　　　　　　　　　　　　　　*[Real driving]*

<img src="./gif/real_driving.gif" width="400" height="300"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="./gif/real_driving_cam.gif" width="300" height="300">  

  
## What is Smart-BallBot?  

- Smart BallBot is an __*automatic tennis ball collection robot*__.  
- The robot could replace the role of 'ball person' picking up a tennis ball that fell to the bottom of the tennis court.  
- This will improve the convenience of tennis players and contribute to preventing the injury of 'ball person'.  

<img src="./img/smartballbots_summary.png" width="600" height="400">  

  
We have created a robot with improved __*portability*__ than Tennibot, a representative automatic tennis ball collection robot.  

<img src="./img/diffetiation.png" width="600" height="400">  

### This project completed autonomous driving through the following functions.

- __*Object detection*__ through *Yolov4*.
- __*Object tracking*__ through the distance value of depth camera(intel realsense D435) and object detection.
- __*Search driving*__ function that is implemented when no object exists on the frame.
- __*Avoiding obstacles*__ through lidar values (if obstacles is a wall or if obstacles is not a wall)



[weight, data, ppt, report link](https://drive.google.com/drive/folders/1Z5RPslZzYfOkavRUon8S_9rod0F4WjUD?usp=sharing)

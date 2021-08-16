# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/piai/hustar_ballbot/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/piai/hustar_ballbot/build

# Include any dependencies generated for this target.
include vision/CMakeFiles/camera.dir/depend.make

# Include the progress variables for this target.
include vision/CMakeFiles/camera.dir/progress.make

# Include the compile flags for this target's objects.
include vision/CMakeFiles/camera.dir/flags.make

vision/CMakeFiles/camera.dir/src/camera.cpp.o: vision/CMakeFiles/camera.dir/flags.make
vision/CMakeFiles/camera.dir/src/camera.cpp.o: /home/piai/hustar_ballbot/src/vision/src/camera.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/piai/hustar_ballbot/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object vision/CMakeFiles/camera.dir/src/camera.cpp.o"
	cd /home/piai/hustar_ballbot/build/vision && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/camera.dir/src/camera.cpp.o -c /home/piai/hustar_ballbot/src/vision/src/camera.cpp

vision/CMakeFiles/camera.dir/src/camera.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/camera.dir/src/camera.cpp.i"
	cd /home/piai/hustar_ballbot/build/vision && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/piai/hustar_ballbot/src/vision/src/camera.cpp > CMakeFiles/camera.dir/src/camera.cpp.i

vision/CMakeFiles/camera.dir/src/camera.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/camera.dir/src/camera.cpp.s"
	cd /home/piai/hustar_ballbot/build/vision && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/piai/hustar_ballbot/src/vision/src/camera.cpp -o CMakeFiles/camera.dir/src/camera.cpp.s

vision/CMakeFiles/camera.dir/src/camera.cpp.o.requires:

.PHONY : vision/CMakeFiles/camera.dir/src/camera.cpp.o.requires

vision/CMakeFiles/camera.dir/src/camera.cpp.o.provides: vision/CMakeFiles/camera.dir/src/camera.cpp.o.requires
	$(MAKE) -f vision/CMakeFiles/camera.dir/build.make vision/CMakeFiles/camera.dir/src/camera.cpp.o.provides.build
.PHONY : vision/CMakeFiles/camera.dir/src/camera.cpp.o.provides

vision/CMakeFiles/camera.dir/src/camera.cpp.o.provides.build: vision/CMakeFiles/camera.dir/src/camera.cpp.o


# Object files for target camera
camera_OBJECTS = \
"CMakeFiles/camera.dir/src/camera.cpp.o"

# External object files for target camera
camera_EXTERNAL_OBJECTS =

/home/piai/hustar_ballbot/devel/lib/vision/camera: vision/CMakeFiles/camera.dir/src/camera.cpp.o
/home/piai/hustar_ballbot/devel/lib/vision/camera: vision/CMakeFiles/camera.dir/build.make
/home/piai/hustar_ballbot/devel/lib/vision/camera: /home/piai/catkin_build_ws/src/vision_opencv/cv_bridge/build/devel/lib/libcv_bridge.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_calib3d.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_dnn.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_features2d.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_flann.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_gapi.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_highgui.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_ml.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_objdetect.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_photo.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_stitching.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_video.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_videoio.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_alphamat.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_aruco.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_bgsegm.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_bioinspired.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_ccalib.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudaarithm.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudabgsegm.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudacodec.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudafeatures2d.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudafilters.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudaimgproc.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudalegacy.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudaobjdetect.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudaoptflow.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudastereo.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudawarping.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudev.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_datasets.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_dnn_objdetect.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_dnn_superres.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_dpm.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_face.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_freetype.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_fuzzy.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_hdf.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_hfs.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_img_hash.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_intensity_transform.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_line_descriptor.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_optflow.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_phase_unwrapping.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_plot.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_quality.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_rapid.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_reg.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_rgbd.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_saliency.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_sfm.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_shape.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_stereo.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_structured_light.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_superres.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_surface_matching.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_text.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_tracking.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_videostab.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_xfeatures2d.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_ximgproc.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_xobjdetect.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_xphoto.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_core.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_imgproc.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_imgcodecs.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /opt/ros/melodic/lib/libroscpp.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /opt/ros/melodic/lib/librosconsole.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /opt/ros/melodic/lib/librostime.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /opt/ros/melodic/lib/libcpp_common.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_gapi.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_stitching.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_alphamat.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_aruco.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_bgsegm.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_bioinspired.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_ccalib.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudabgsegm.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudafeatures2d.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudaobjdetect.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudastereo.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_dnn_objdetect.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_dnn_superres.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_dpm.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_face.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_freetype.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_fuzzy.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_hdf.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_hfs.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_img_hash.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_intensity_transform.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_line_descriptor.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_quality.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_rapid.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_reg.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_rgbd.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_saliency.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_sfm.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_stereo.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_structured_light.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_superres.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_surface_matching.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_tracking.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_videostab.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_xfeatures2d.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_xobjdetect.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_xphoto.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/lib/x86_64-linux-gnu/librealsense2.so.2.48.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_highgui.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_shape.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_datasets.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_plot.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_text.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_dnn.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_ml.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_phase_unwrapping.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudacodec.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_videoio.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudaoptflow.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudalegacy.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudawarping.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_optflow.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_ximgproc.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_video.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_imgcodecs.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_objdetect.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_calib3d.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_features2d.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_flann.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_photo.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudaimgproc.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudafilters.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_imgproc.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudaarithm.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_core.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: /usr/local/lib/libopencv_cudev.so.4.4.0
/home/piai/hustar_ballbot/devel/lib/vision/camera: vision/CMakeFiles/camera.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/piai/hustar_ballbot/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/piai/hustar_ballbot/devel/lib/vision/camera"
	cd /home/piai/hustar_ballbot/build/vision && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/camera.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
vision/CMakeFiles/camera.dir/build: /home/piai/hustar_ballbot/devel/lib/vision/camera

.PHONY : vision/CMakeFiles/camera.dir/build

vision/CMakeFiles/camera.dir/requires: vision/CMakeFiles/camera.dir/src/camera.cpp.o.requires

.PHONY : vision/CMakeFiles/camera.dir/requires

vision/CMakeFiles/camera.dir/clean:
	cd /home/piai/hustar_ballbot/build/vision && $(CMAKE_COMMAND) -P CMakeFiles/camera.dir/cmake_clean.cmake
.PHONY : vision/CMakeFiles/camera.dir/clean

vision/CMakeFiles/camera.dir/depend:
	cd /home/piai/hustar_ballbot/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/piai/hustar_ballbot/src /home/piai/hustar_ballbot/src/vision /home/piai/hustar_ballbot/build /home/piai/hustar_ballbot/build/vision /home/piai/hustar_ballbot/build/vision/CMakeFiles/camera.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vision/CMakeFiles/camera.dir/depend


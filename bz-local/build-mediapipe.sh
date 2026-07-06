# Note: these are the commands I personally run when compiling MediaPipe using Bazel. Use these as an example, but don't be surprised if they don't work.

# If using system OpenCV, install these dependencies. You'll need to edit WORKSPACE and third_party/opencv_local.BUILD
#sudo apt install libopencv-core-dev libopencv-highgui-dev libopencv-calib3d-dev libopencv-features2d-dev libopencv-imgproc-dev libopencv-video-dev

#CC=/usr/bin/clang
#CXX=/usr/bin/clang++
XDG_CACHE_HOME=/tmp
#bazel-7.4.1 clean
bazel-7.4.1 build \
    --action_env=CC=clang-16 \
    --action_env=CXX=clang++-16 \
    --verbose_failures \
    --distdir=bz-local \
    -c opt --linkopt -s --strip always \
    --copt -DMESA_EGL_NO_X11_HEADERS \
    --copt -DEGL_NO_X11 \
    //mediapipe/tasks/c:libmediapipe.so
#bazel-7.4.1 build --compilation_mode dbg --verbose_failures --distdir=$LOCALREPOS -c opt --linkopt -s --strip never --define MEDIAPIPE_DISABLE_GPU=1 //mediapipe/tasks/c:libmediapipe.so
#bazel-7.4.1 build --verbose_failures --distdir=$LOCALREPOS -c opt --linkopt -s --strip always //mediapipe/examples/desktop/holistic_tracking:holistic_tracking_cpu
#bazel-7.4.1 build --verbose_failures --distdir=$LOCALREPOS -c opt --linkopt -s --strip always //mediapipe/examples/desktop/holistic_tracking:holistic_tracking_gpu
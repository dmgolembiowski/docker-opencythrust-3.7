# Opencythrust-3.7 for Docker
> A helpful Dockerfile for developers looking to build an OpenCV prototype in Python 3.7, then optimize it with Rust bindings.
It leverages the [opencv-rust](https://github.com/twistedfall/opencv-rust) by twistedfall and kali,
 as well as (opencv-python)[https://github.com/skvark/opencv-python] while simultaneously making 
the build process for the development environment 100% pain-free!

This Docker pod would not be possible without mikigom's game-changing 
[pull request](https://github.com/janza/docker-python3-opencv/pull/28) which allows for an OpenCV-contrib
version that supports non-free, patented algorithims like SIFT, and yes - the (Rust library by
twistedfall also supports these non-free implementations)[https://github.com/twistedfall/opencv-rust/blob/master/LICENSE].

### Instructions

```bash
docker run -it dmgolembiowski/Opencythrust-3.7 python3
>>> import cv2
>>> cv2.xfeatures2d.SIFT_create
```

### Credits
(Junghoon Seo)[sjh14@gist.ac.kr]
(Josip Janzic janza)[https://github.com/janza/docker-python3-opencv]
(twistedfall)[https://github.com/twistedfall/opencv-rust]


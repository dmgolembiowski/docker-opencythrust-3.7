# Opencythrust-3.7 for Docker
> A helpful Dockerfile for developers looking to prototype an OpenCV-Python for version 3.7, then rewrite the final version in Rust. It leverages the [opencv-rust](https://github.com/twistedfall/opencv-rust) by twistedfall and kali,
 as well as [opencv-python](https://github.com/skvark/opencv-python) while simultaneously making 
the build process for the development environment 100% pain-free!

This Docker pod would not be possible without mikigom's game-changing 
[pull request](https://github.com/janza/docker-python3-opencv/pull/28) which allows for an OpenCV-contrib
version that supports non-free, patented algorithims like SIFT, and yes - the [Rust library by
twistedfall also supports these non-free implementations](https://github.com/twistedfall/opencv-rust/blob/master/LICENSE).

### Instructions

```
docker run -it dmgolembiowski/opencythrust-3.7:contrib bash
root@a1b2c3d4 # python3
>>> import cv2
>>> help(cv2.xfeatures2d.SIFT_create)
```

### Credits
- [Junghoon Seo](sjh14@gist.ac.kr)
- [Josip Janzic janza](https://github.com/janza/docker-python3-opencv)
- [twistedfall](https://github.com/twistedfall/opencv-rust)

### Roadmap

> Integrate this Dockerfile build with one that supports Nvidia-GPU computing out of the box <br />

> Develop sections responsible for installing XCode and Android SDK binaries to support local builds and native cloud deployments <br />

> Maybe tying this build together with some additional helper-scripts that facilitate simpler integrations with Weld and PyO3 <br />

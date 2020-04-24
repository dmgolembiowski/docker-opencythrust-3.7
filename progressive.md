### Notes
> This section covers package installations that should simply be baked into the Dockerfile's installation process. In particular, this are RUN command that should be run after a successful OpenCV build fully succeeds.

```bash
# Replace the Dockerfile's long for-loop with something that runs on startup for root.
```

```bash
sudo apt-get install assimp-utils libassimp-dev libassimp-doc libassimp4 python3-pyassimp gfortran python-numpy-doc python3-numpy-dbg python3-setuptools python3-gdbm-dbg python3-tk-dbg gdbserver gfortran-8-multilib libgfortran5-dbg libcoarrays-dev vlc
```

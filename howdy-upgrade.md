# Install howdy after upgrade Dell XPS 13 (9310) from 20.04 to 22.04
Uninstall existing howdy with
```sh
sudo apt remove howdy
```

Reinstall howdy (shell command below is from Howdy's github)
```sh
sudo add-apt-repository ppa:boltgolt/howdy
sudo apt update
sudo apt install howdy
```
This should guide you through the process, but it might not be configured to use the IR emitter + camera.
To do so, follow the steps below

Check which camera is IR camera on your PC (you'll get a black and white video)
```sh
# install ffmpeg to check camera directly
sudo apt install ffmpeg
# list cameras
sudo v4l2-ctl --list-devices
# use `ffplay` to turn on camera and see output
# "dev/video2" from the output of `sudo v4l2-ctl --list-devices`
# usually /dev/video2 is IR camera
ffplay /dev/video2
```

Configure howdy to use IR camera:
```sh
sudo howdy config #should open a config.ini file in your shell text editor
```
In the config file, edit `device_path`, in this example,
```ini
device_path = /dev/video2
```
If your IR emitter is not flashing, you will need to do the following steps

1. Install IR emitter driver
Follow install instructions on https://github.com/EmixamPP/linux-enable-ir-emitter
1.1. If you run into `glibcxx 3.4 32 not found` error, you'll have to update your GCC
```sh
sudo apt install libstdc++6 # on ubuntu 22.04 this was already latest
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
```
2. Configure IR emitter by running the following command and following the steps.
```sh
sudo linux-enable-ir-emitter configure
```
3. Test howdy login activates IR emitter
```sh
sudo howdy test
```
4. If you want to reset the facial models
```sh
sudo howdy clear
sudo howdy -U YOUR_NAME add
```

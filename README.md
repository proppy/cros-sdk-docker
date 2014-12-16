# cros-sdk docker image

Docker image for [Chromium OS](http://www.chromium.org/chromium-os) SDK.

## Building

```
# build `cros-sdk` and `cros-sdk:beaglebone` images
./build
# re-use depots sources cache from previous build
CACHE_OPTS= ./build
# build for multiple boards
BOARD="x86-generic arm-generic beaglebone" ./build
```

## Usage

```
# start a cros-sdk shell
docker run --privileged -ti cros-sdk 
# run a cros-sdk command
docker run --privileged cros-sdk -- ./setup_board --board=beaglebone)
# use beaglebone image variant
docker run --privileged -ti cros-sdk:beaglebone
```

## Disclaimer

This is not an official Google product.

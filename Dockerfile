# Copyright 2014 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install --no-install-recommends -y git-core gitk git-gui subversion curl ca-certificates python xz-utils sudo
RUN useradd cros --create-home
RUN echo 'cros ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
USER cros
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git /home/cros/depot_tools
ENV PATH /home/cros/depot_tools:$PATH
RUN mkdir /home/cros/chromiumos
WORKDIR /home/cros/chromiumos
RUN repo init -u https://chromium.googlesource.com/chromiumos/manifest.git --repo-url https://chromium.googlesource.com/external/repo.git -g minilayout
RUN repo sync
ENTRYPOINT ["/home/cros/depot_tools/cros_sdk"]

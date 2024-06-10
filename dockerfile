FROM kicad/kicad:8.0.3

RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends curl &&\
    sudo apt-get clean &&\
    sudo rm -rf /var/lib/apt/lists/*

RUN sudo mkdir /usr/share/kicad/3dmodels && curl https://gitlab.com/kicad/libraries/kicad-packages3D/-/archive/$(kicad-cli -v)/kicad-packages3D-$(kicad-cli -v).tar.bz2 | sudo tar -xj -C /usr/share/kicad/3dmodels --strip-components=1

RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends pip &&\
    sudo apt-get clean &&\
    sudo rm -rf /var/lib/apt/lists/* &&\
    sudo rm -f /usr/lib/python*/EXTERNALLY-MANAGED

ENV PATH=/home/kicad/.local/bin:$PATH

RUN pip3 install kikit

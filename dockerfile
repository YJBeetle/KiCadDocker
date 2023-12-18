FROM kicad/kicad:7.0.9

RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends curl &&\
    sudo apt-get clean &&\
    sudo rm -rf /var/lib/apt/lists/*

RUN sudo mkdir /usr/share/kicad/3dmodels && curl https://gitlab.com/kicad/libraries/kicad-packages3D/-/archive/$(kicad-cli -v)/kicad-packages3D-$(kicad-cli -v).tar.bz2 | sudo tar -xj -C /usr/share/kicad/3dmodels --strip-components=1

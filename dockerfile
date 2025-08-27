FROM kicad/kicad:9.0.3-full

RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends pip &&\
    sudo apt-get clean &&\
    sudo rm -rf /var/lib/apt/lists/* &&\
    sudo rm -f /usr/lib/python*/EXTERNALLY-MANAGED

ENV PATH=/home/kicad/.local/bin:$PATH

RUN pip3 install kikit

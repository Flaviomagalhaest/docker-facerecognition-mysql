FROM python:3.6-slim-stretch

RUN apt-get -y update
RUN apt-get install -y --fix-missing \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    curl \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-dev \
    libavcodec-dev \
    libavformat-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    python3-dev \
    python3-numpy \
    software-properties-common \
    zip \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*

# Clone dlib
RUN cd ~ && \
    mkdir -p dlib && \
    git clone -b 'v19.9' --single-branch https://github.com/davisking/dlib.git dlib/ && \
    cd  dlib/ && \
    python3 setup.py install --yes USE_AVX_INSTRUCTIONS

# The lines 35-44 bellow is for case you need to clone a private repository ------------
# Create .ssh directory to place the key of private repository
RUN mkdir /root/.ssh/

# Copy key to repository inside container
COPY docker/id_rsa /root/.ssh/id_rsa

# Run command to validate key in repository and add know_hosts
RUN chmod 400 /root/.ssh/id_rsa && \
    touch /root/.ssh/known_hosts && \
    ssh-keyscan -T 60 bitbucket.org >> /root/.ssh/known_hosts
# ---------------------------------------------------------------------------------------

# Clone >>>>YOUR APP<<<<< repository here. (As an example, this command will clone ageitgey face_recogntion)
RUN git clone git@bitbucket.org:ageitgey/face_recognition.git && \ 
    # Changes the folder name of the cloned project to 'app'
    mv face_recognition app

# Set workdir and install dependencies of project
WORKDIR /app
# Installs dependecies added in requirements.txt
RUN pip3 install -r docker/requirements.txt
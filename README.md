
# Docker Compose [face_recognition + MySQL] project

A docker-compose template to build your app in a container with [face_recognition lib](https://github.com/ageitgey/face_recognition) + a container with MySQL database.

<p align="center">
  <img width="630" height="630" src="https://github.com/Flaviomagalhaest/docker-facerecognition-mysql/blob/master/images/Diagram.png">
</p>

This docker-compose project was build to run a container with your app +  [face_recognition lib](https://github.com/ageitgey/face_recognition) + some specific dependencies and a container with a MySQL Database. This containers will have free access each other for the same Compose and case you need scale your application adding some other containers, the database will be continue unique and equally accessible.
Was build some aditional configs to dev and prod enviroments.

## Getting Started

Initially, clone this repository inside your project directory in a directory called 'docker'. 

### Prerequisites
```
docker
docker-compose
```
Any doubt to install **compose** is just check [documentation](https://docs.docker.com/compose/install/)
If you trying install in a Raspberry Pi, i recommend [this Ryan Gordon Tutorial](https://medium.freecodecamp.org/the-easy-way-to-set-up-docker-on-a-raspberry-pi-7d24ced073ef)

## Installing
 1. In file **docker-compose.yml** change the *line 7* to inital command that will be executed after container up. In this example i'll initialize a python app with "python app.py" after all instalation present in Dockerfile.
**Remember that .yml files need correct indentation.**

 ``
 command: "python app.py"  #start command of your app
 ``
 
 2. Do the same in *line 13*. But to container that have MySQL Database.

 ``
command: --default-authentication-plugin=mysql_native_password
 ``
 
 3. In *line 17* you can configure the root password of your database.
  ``
MYSQL_ROOT_PASSWORD: root  #db password
 ``
 
 4. In mysql/scripts/.  you can put all your sql scripts that will be executed in database creation.
 
### Development version
Follow this steps to configure the Dev version:

 1. In **docker-compose.override.yml** line 9  you can configure the volumes of the application container (Read more about docker volumes [here](https://docs.docker.com/storage/volumes/))

 ### Production version
 Follow this steps to configure the Prod version:
 1. The prod version of compose will clone your app repository. So, if your app repository is not public, you will need to add a private key in **id_rsa** file

 2. In *line 48* of **your-app/Dockerfile** you will replace this repository with your application / project repository

  ``
RUN git clone git@bitbucket.org:ageitgey/face_recognition.git && \
 ``
 
 3. In *line 50* you will replace for the name of your project.
 
   ``
mv your-project-name app
 ``

### Requirements.txt
This .txt will be concentrate all dependencies that will be installed in container of application


## Deployment

### Differences of dev and prod versions
The dev version will have volumes configured and will be read **Dockerfile.dev** to build the application container. The Dockerfile.dev will copy all itens in directory of application to inside the container.

The prod version will use Dockerfile to build the application container and will not copy any item to inside the container, instead, will clone the application repository.   And **restart** mode will be configured to always restart the containers, doest not matter what cause of interruption.

### Run Dev version
To run dev version is just go in Docker directory and run the command below:
```
docker-compose up --build
```
This command will execute the following files:
**docker-compose.yml
docker-compose.override.yml**

### Run Prod version
To run prod version is just go in Docker directory and run the command below:
```
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build
```
This command will execute the following files:
**docker-compose.yml
docker-compose.prod.yml**



## Contributing

I build this architeture working in some projects with [face_recognition lib](https://github.com/ageitgey/face_recognition) and any addition, opinion or experience will be welcome.


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* [Adam Geitgey](https://github.com/ageitgey) to face recognition lib
* [Stephen Grider](https://github.com/StephenGrider) by some Docker knowledge



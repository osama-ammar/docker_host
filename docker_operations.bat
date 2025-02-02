:: this file should build the docker image indicated in the Dockerfile.yaml and run tag , push , save the image i needed ... with some info about the process and basi concepts

:: image :  lightweight, standalone, executable package that includes everything needed to run a piece of software, including the code, a runtime, libraries, environment variables, and configuration files
:: container : image like class , container looks like an oblject from this class . we may have many containers from the same image , When you start a container 
::             from an image, Docker creates a writable container layer on top of the image's read-only layers. This writable layer allows the container to modify its filesystem during runtime, such as writing logs or storing data.
:: docker file :  text document that contains instructions for building a Docker image. It specifies the base image, any dependencies, environment variables, and commands needed to create the image.
:: volumes : Containers can use volumes to store data

:: Define constants  %IMAGE_NAME% ,  mode=[traing, seve ....]
set IMAGE_NAME= ml-docker-app
set PORT=5000
set MODE= train
set WORKDIR =  /usr/src/app

:: building a docker image for this project and naming it as  %IMAGE_NAME%  
:: you should run docker engine first , before build
docker build -t  %IMAGE_NAME% .

:: run the image interactively and remove the container when it exits:
@REM docker run -it --rm  %IMAGE_NAME% . ::for interactive use of a container and temporary execution. the 2nd line   is used to run the container and expose a port for communication.
docker run -p %PORT%:%PORT%  %IMAGE_NAME%  
:: Once you have a Docker Hub account, you need to log in through the command line on your local machine. Open your terminal and run:
:: Before you can push an image to Docker Hub, it must be tagged with your Docker Hub username. If you don’t tag it correctly, Docker will not know where to push the image.
:: tag your docker image
:: To push the image to Docker Hub, use the docker push command followed by the name of the image you want to push:because 01111215596 is my user name in dockerhup (remove below comment if you want)

@REM docker login
@REM docker tag  %IMAGE_NAME% osama/ %IMAGE_NAME%
@REM docker push osama/ %IMAGE_NAME%

:: Check the Pushed Container Image on Docker Hub
:: You can go to your Docker Hub repository and see the recently pushed image.
:: You have successfully containerized a simple machine learning application, pushed it to Docker Hub, and made it available to be pulled and run from anywhere.


:: you can manually export Docker image archives instead. This functionality is also built into the Docker CLI. Build your image and then use the docker save command to get a tar archive of its contents:
@REM docker save  %IMAGE_NAME%:latest >  %IMAGE_NAME%.tar


:: To use an exported image, run the docker load command. This accepts a tar archive produced by docker save as an input stream. Docker will load the archive's contents and add it to your list of local images.
@REM docker load <  %IMAGE_NAME%.tar

REM you can use docker compose file that contain many docker operations in one file then run the following at this file location
docker-compose up --build -d


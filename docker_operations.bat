REM image :  lightweight, standalone, executable package that includes everything needed to run a piece of software, including the code, a runtime, libraries, environment variables, and configuration files
REM container : image like class , container looks like an oblject from this class . we may have many containers from the same image , When you start a container 
REM             from an image, Docker creates a writable container layer on top of the image's read-only layers. This writable layer allows the container to modify its filesystem during runtime, such as writing logs or storing data.
REM docker file :  text document that contains instructions for building a Docker image. It specifies the base image, any dependencies, environment variables, and commands needed to create the image.
REM volumes : Containers can use volumes to store data


REM building a docker image for this project and naming it as ml-docker-app  
REM you should run docker engine first , before build
docker build -t ml-docker-app .

REM run the image?
docker run -it --rm ml-docker-app .

REM Once you have a Docker Hub account, you need to log in through the command line on your local machine. Open your terminal and run:
docker login


REM Before you can push an image to Docker Hub, it must be tagged with your Docker Hub username. If you don’t tag it correctly, Docker will not know where to push the image.
REM tag your docker image
docker tag ml-docker-app osama/ml-docker-app

REM To push the image to Docker Hub, use the docker push command followed by the name of the image you want to push:
docker push osama/ml-docker-app

REM Check the Pushed Container Image on Docker Hub
REM You can go to your Docker Hub repository and see the recently pushed image.
REM You have successfully containerized a simple machine learning application, pushed it to Docker Hub, and made it available to be pulled and run from anywhere.


REM you can manually export Docker image archives instead. This functionality is also built into the Docker CLI. Build your image and then use the docker save command to get a tar archive of its contents:
docker save my-image:latest > my-image.tar


REM To use an exported image, run the docker load command. This accepts a tar archive produced by docker save as an input stream. Docker will load the archive's contents and add it to your list of local images.
docker load < my-image.tar


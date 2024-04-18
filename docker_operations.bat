REM image : 
REM container :
REM docker :
REM build image|container  means -->

REM building a docker image for this project and naming it as ml-docker-app  
REM you should run docker engine first , before build
docker build -t ml-docker-app .

REM run the image?
docker run -it --rm ml-docker-app .

REM Once you have a Docker Hub account, you need to log in through the command line on your local machine. Open your terminal and run:
docker login


REM Before you can push an image to Docker Hub, it must be tagged with your Docker Hub username. If you don’t tag it correctly, Docker will not know where to push the image.
REM tag your docker image
docker tag ml-docker-app username/ml-docker-app

REM To push the image to Docker Hub, use the docker push command followed by the name of the image you want to push:
docker push username/ml-docker-app

REM Check the Pushed Container Image on Docker Hub
REM You can go to your Docker Hub repository and see the recently pushed image.
REM You have successfully containerized a simple machine learning application, pushed it to Docker Hub, and made it available to be pulled and run from anywhere.
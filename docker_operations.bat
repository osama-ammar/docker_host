
REM building a docker image for this project and naming it as ml-docker-app  
REM you should run docker engine first , before build
docker build -t ml-docker-app .

REM run the image?
docker run -it --rm ml-docker-app .

REM Once you have a Docker Hub account, you need to log in through the command line on your local machine. Open your terminal and run:
docker login

REM tag your docker image
docker tag ml-docker-app username/ml-docker-app


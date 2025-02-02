# Use an official Python runtime as a parent image\
#for cuda version use , otherwise ---> FROM python:3.9-slim
#FROM nvidia/cuda:11.1.1-cudnn8-runtime-ubuntu20.04

# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in requirements.txt ...use   --no-cache-dir  for smaller size image (clearning cache)
RUN pip install  -r requirements.txt    

# Expose port 5000
EXPOSE 5000

# Training the model mode --> this Runs train_model.py (model_training) when the container launches #? executed when you run the container (if you used the next line to build an image for training , the model will not be saved locally bu inside the docker)
#CMD ["python", "./train_model.py"]

# model inference using flask (but you should have your model trained and saved in this dir )
CMD ["python", "./model_inference.py"]
#when running the docker and api is working to accept request ...send this request :curl -X POST -H "Content-Type: application/json" -d "{\"features\": [5.1, 3.5, 1.4, 0.2]}" http://127.0.0.1:5000/predict
# it will send you the answer

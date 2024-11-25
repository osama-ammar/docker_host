# Use an official Python runtime as a parent image\
#for cuda version use , otherwise ---> FROM python:3.9-slim
#FROM nvidia/cuda:11.1.1-cudnn8-runtime-ubuntu20.04

FROM apache/airflow:2.0.2
RUN pip install scikit-learn pandas matplotlib joblib



# # Set the working directory in the container
# WORKDIR /usr/src/app

# # Copy the current directory contents into the container at /usr/src/app
# COPY . .

# Install any needed packages specified in requirements.txt
#RUN pip install --no-cache-dir -r requirements.txt

# Run app.py when the container launches #? executed when you run the container
#CMD ["python", "./sklearn_model.py"]
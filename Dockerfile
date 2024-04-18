# Use an official Python runtime as a parent image\
#for cuda version use , otherwise ---> FROM python:3.9-slim
FROM nvidia/cuda:11.1.1-cudnn8-runtime-ubuntu20.04

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

#RUN  pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
# Run app.py when the container launches
CMD ["python", "./app.py"]
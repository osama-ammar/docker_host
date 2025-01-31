
::  after having yor docker image and the ml model inside and it's working , ensure initializing kupernates in docker desktop ,then , configure deployment.yaml and service.yaml and ensure you put the rigtht name of your docker image in deployment.yaml , the applay the following commands

:: applying service config
kubectl apply -f service.yaml

:: Lists all the pods in the cluster with their status, restart count, and age.
kubectl get pods  

::Lists all services in the cluster with their type, IP, and exposed ports.
kubectl get services

::forwards port 5000 on your local machine to port 5000 on the ml-app-service service running in your Kubernetes cluster. This allows you to access the service locally via localhost:5000.
kubectl port-forward svc/ml-app-service 5000:5000
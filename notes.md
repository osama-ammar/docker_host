

# Docker Notes
==================

- in the last run , the webserver was not running , I foun that port is used by abother process that i don/t know in this computer --> i get this process from task manager and ended it  , then rerun air flow again and it worked
- check logs in docker desktop to findout problems
- to know running apps that uses specific port  ...run this in cmd [netstat -aon | findstr :8080]
- most problem s I face are due to used ports by other applications .... so I changed port in docker compose file ....details of ports:

  """
  ports:
  - 8081:8080
  """

  8081 (Host Port):
  This is the port on your host machine (your computer) that will be used to access the service running inside the container.
  In this case, when you navigate to http://localhost:8081 on your browser, the request is forwarded to the container.

  8080 (Container Port):
  This is the port inside the Docker container that the service (Airflow webserver) listens to.
  The Airflow



# model inference using docker
in docker file : CMD ["python", "./model_inference.py"]
#when running the docker and api is working to accept request ...send this request :  
and the server in the docker will send you the answer



## Model deployment as a service
### curl -X POST -H "Content-Type: application/json" -d "{\"features\": [7.1, 4.5, 0.4, 0.2]}" http://127.0.0.1:5000/predict
Explanantion :
curl      ---> amd tool to send requsts
-X POST      ---> method will be used in this request (post for sending data..)
-H "Content-Type: application/json"      ---> the header about  sent data (info about the nature of sent data , its type  , structure ....
-d "{\"features\": [5.1, 3.5, 1.4, 0.2]}"      ---> the payload (data itself)
http://127.0.0.1:5000/predict     ---> loacation where the request will be sent to (will be sent to [preict] end point using port (5000)

             (( the port may have many end points looks like the port is the main door of a house(server app) and endpoints are rooms inside this house , each 
               one have a functionality))




------------------------------------------------------------------------------------------------------------------------------------------------------------
## Kubernates

- whan you have your model or app packaged in a docker , and you want to expose this model or app to millions of users

and at the same time avoid app crash when tons of requests received by the app at te same time ,  Kubernates is a tool used for such purpose , it helps in scaling inference workloads , mange resources and save repetitve tasks (logging ..........)

it has 2 main layers :

- Service Layer
- Deplyment Layer

#### COMPONENTS

- Cluster: The entire system of nodes managed by Kubernetes.
- Node: A single machine (physical or virtual) that runs workloads in the cluster - host and run pods.
- Pod: The smallest deployable unit in Kubernetes, containing one or more containers.
- Ingress: Manages external HTTP/HTTPS traffic to services.
- kubectl: Command-line tool to manage Kubernetes resources.

#### WORKFLOW:

- when requests come , the service layer meet them , the scedulaer contribute request between pods using a load-balancing mechanism , when traffic exceed cabacity , new pods are created according a pre-defined autoscaling policy
- Nodes are servers (or machines contain CPU , RAM , GPU ...) where work happens.

  Pods are containers or units of work that are scheduled to run on nodes (utilize Nodes resources).

  When traffic increases, Kubernetes may create more pods to handle the load. If there are not enough nodes to run those
  pods, Kubernetes can add more nodes to the cluster.

#### STEPS:

- Prepare the Model: Save the trained model and write inference API code.
- Containerize: Create and test a Docker image with the model and API.
- Set Up Cluster: Access a Kubernetes cluster and configure kubectl.
- Write Configs: Define Deployment.yaml and Service.yaml YAML files.
- Deploy: Apply YAML files to deploy the model.-->
- Test: Access the service and test the API endpoint.
- Scale: Monitor and adjust replicas as needed.
- Automate: Use CI/CD and Helm for streamlined deployment.

in code:  after having yor docker image and the ml model inside and it's working , ensure initializing kupernates in docker desktop ,then , configure deployment.yaml and service.yaml and ensure you put the rigtht name of your docker image in deployment.yaml , the applay the following commands 
    [kubectl apply -f deployment.yaml]              ---> applying deplyment config
    [kubectl apply -f service.yaml]                ---> applying service config
    [kubectl get pods]                              --->  Lists all the pods in the cluster with their status, restart count, and age.
    [kubectl get services]                            ---> Lists all services in the cluster with their type, IP, and exposed ports.
    [kubectl port-forward svc/ml-app-service 5000:5000]     ---->  forwards port 5000 on your local machine to port 5000 on the ml-app-service service running in your Kubernetes cluster. This allows you to access the service locally via localhost:5000.

you may try now to test the api by sending request to this port , und you shouls get a response and see logs in commmand line under last command run


-----------------------------------------------------------------------------------------------------------------------------
# **Airflow** 
  is a workflow management system that defines tasks and and their dependencies as code,
  executes those tasks on a regular schedule, and distributes task execution across worker processes.
  Airflow offers an excellent UI that displays the states of currently active and past tasks,
  shows diagnostic information about task execution, and allows the user to manually manage the execution and state of tasks.

- what happens when we run airflow ..... DAGs directory will be scanned to see tasks to be run ()
- the included tasks will be run as configured in dags files (ml-model-dag.py in my case)
- in my case this task will run daily as long as docker container is runnning
- to see the details of the task .. in airflow ui , click on the task .. click logs and you will see details we will need these at the samme directory:
- docker file : The Dockerfile ensures that the required dependencies are baked into the image itself. This means every container started from the image will already have all the dependencies installed.
- docker compose file: If you only use docker-compose.yaml and point to the base Airflow image (apache/airflow), it will not include extra libraries like scikit-learn. This is why you're getting errors like ModuleNotFoundError: No module named 'sklearn'




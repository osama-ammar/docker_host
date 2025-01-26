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

#### WORKFLOW

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
- Deploy: Apply YAML files to deploy the model.
- Test: Access the service and test the API endpoint.
- Scale: Monitor and adjust replicas as needed.
- Automate: Use CI/CD and Helm for streamlined deployment.

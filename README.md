# Build and deploy SPA to the Cloud

Setting up the CircleCI to listen GitHub-repo changes,
so that on every Git push:
* CircleCI will
  * build the app
  * run the tests
  * build an Docker image
  * pushes the image to Azure Container Registry
* Azure Container Registry has a (automatically generated) Webhook to Azure App Service, and that will
  * whenever pushing a new image to registry
    * container is auto-deployed to web app


## CircleCI

circleci.com

* Log in with your GitHub credentials
* Projects -> Setup Project
* Language: `Node`
* Creates a folder named `.circleci` with a file `config.yml`
  * `/.circleci/config.yml`
* What the buildfile does:
  * builds Angular app
  * runs Angular tests
  * builds an Docker image
  * logs in to Docker registry on Azure
  * pushes Docker image to the registry


![circleci job](/circleci_job.png)

* Also you need to add the Environment Variables (Project Settings -> Environment Variables):
  * `DOCKER_USER`
  * `DOCKER_PASS`


## Azure

* Free account: https://aka.ms/free
* Azure portal: portal.azure.com

### Azure Container Registry

* Create private Azure Container Registry
* A place for Docker images
  * see Login server url: `***.azurecr.io`

* After pushing the LOCAL Docker image to the registry:
  * Create a web app (Azure App Service):
![circleci job](/azure_deploy.png)
Select `Deploy to Web App`.


### VS Code
* Build Docker image locally
  * see `config.yml` for instructions
* Tag the image as `***.azurecr.io/hello:1.0` (this is important for Azure)
* Docker login to Azure Container Registry
* Push the image to Azure
* As a result Container Registry has the repository 'hello' with tag '1.0'


### Azure App Service

* See Overview -> `URL` (this is your link to the web app)




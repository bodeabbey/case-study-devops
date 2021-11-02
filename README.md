# case-study-devops
A particular step in the docker build process of an app requires access to bitbucket repository to run to completion. Describe how you would grant repository access for a successful build.

Using bash script, Write script that will automatically provision 3 docker containers running kibana version 6.4.2, nginx server, mysql server separately on each container. Solution should be prepared as only one script, which creates three Docker images and run the containers from them. The three docker containers should be able to ping each other regardless of where it is being deployed.

Write a simple ansible script to create a cronjob that prints “hello world” and the time stamp to a file in a server.

Write a terraform script to perform the following functions: 
  a. provision a default vpc and a fully functional private subnet 
    b. deploy an ubuntu instance in the subnet

Write a pipeline, on a jenkins or aws codepipeline system, that will build an image out of a given Dockerfile (you can build this project https://github.com/yeasy/simple-web) and will publish that image to running Kubernetes cluster

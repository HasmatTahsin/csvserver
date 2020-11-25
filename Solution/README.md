# The csvserver assignment's Solution

Using play-with-docker.com for this assignment. Completed the prerequisite by running the following command.

  - docker pull infracloudio/csvserver:latest
  - docker pull prom/prometheus:v2.22.0

# Part 1

  - List all the images : 
```sh
$ docker images
```
 - Run the container in background : 
  
```sh
$ docker run -itd infracloudio/csvserver:latest /bin/bash
```
  - Getting error : 
  ```sh
  $ 2020/11/25 07:12:03 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory
  ```
  - Created bash script file which generate a file named inputFile :
  ```sh 
  $ vi gencsv.sh
  ```
  - Copy the inputFile to container as inputdata :
  ```sh 
  $ docker container cp inputFile csv:/csvserver/inputdata
```
  - List the container :
  ```sh
$ docker ps
```
  - Get into the container :
  ```sh
$ docker exec -it csv /bin/bash
```
  - Get into the container to find the LISTENER port : 
 ```sh 
$ docker exec -it csv ss -lntu
```
  - Stop the running container :
 ```sh 
$ docker stop csv
```
  - Delete the container :
 ```sh
$ docker rm csv
```
  - Run the container to get access on the localhost:9393 also set the environment variable CSVSERVER_BORDER to Orange :
  ```sh 
$ docker run -e CSVSERVER_BORDER="Orange" -p 9300:9393 -it --detach --name csv infracloudio/csvserver:latest /bin/bash
```

### Part 2
 - Stop the container : 
```sh 
$ docker stop csv
```
 - Delete the container : 
 ```sh 
$ docker rm csv
```
 - Create docker-compose.yml file : 
 ```sh 
$ vi docker-compose.yml
```
 - Run the application in detached mode : 
 ```sh
$ docker-compose up -d
```

### Part 3
  - Updating docker-compose.yml by adding Prometheus container.
  - Expose Prometheus port at 9090 on the host.
  - Run the application in detached mode : docker-compose up -d





# Graded-Assignment-on-Dockerizing-a-Plain-HTML-Page-with-Nginx
Graded Assignment on Dockerizing a Plain HTML Page with Nginx


```
URL - public.ecr.aws/w4c5t7g4/graded-assignment-on-dockerizing-a-plain-html-page-with-nginx
```

Solution:

1. Basic HTML Page:

   - Create a plain HTML page named `index.html` with some content (e.g., "Hello, Docker!").

--> Created an index.html file

It will only print 
```
Welcome to My Website
Hello, Docker!
```
--------------------------------------------------------------------------
2. Nginx Configuration:

   - Create an Nginx configuration file named `nginx.conf` that serves the `index.html` page.

   - Configure Nginx to listen on port 80.

--> Created an nginx configuration file, so that the server will listen on port 80 and also the root file path is set to /usr/share/nginx/html,

Which is default location as per the office nginx docker image page.

```
server {
    listen       80;
    listen  [::]:80;
    server_name  _;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

}
```
--------------------------------------------------------------------------
3. Dockerfile:

   - Create a `Dockerfile` to define the Docker image.

   - Use an official Nginx base image.

   - Copy the `index.html` and `nginx.conf` files into the appropriate location in the container.

   - Ensure that the Nginx server is started when the container is run.

--> Created a Dockerfile

used base image - 
```
nginx:alpine3.18-perl
```
on the documenation page or the docker image page itself, we can find the file paths for the root files, and config files

as per documentation - 

```
html pages file path is located in - /usr/share/nginx/html/
&&
configuration file path is - /etc/nginx/conf.d/

```

using RUN command removed the default files in the above file locations

using COPY command, copied the files from local to the docker container

exposed port 80
--------------------------------------------------------------------------

4. Building the Docker Image:

   - Build the Docker image using the `Dockerfile`.

--> 

```
docker build -t graded-assignment-on-dockerizing-a-plain-html-page-with-nginx .
```

5. Push the image on ECR
  - Make the public repository and push them on the ECR

-->

used the below commands to tag the image properly and pushed the image to public ECR

```
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/w4c5t7g4
```

```
docker build -t graded-assignment-on-dockerizing-a-plain-html-page-with-nginx .
```

```
docker tag graded-assignment-on-dockerizing-a-plain-html-page-with-nginx:latest public.ecr.aws/w4c5t7g4/graded-assignment-on-dockerizing-a-plain-html-page-with-nginx:latest
```

```
docker push public.ecr.aws/w4c5t7g4/graded-assignment-on-dockerizing-a-plain-html-page-with-nginx:latest
```

Screenshots attached for the images pushed

```
URL - public.ecr.aws/w4c5t7g4/graded-assignment-on-dockerizing-a-plain-html-page-with-nginx
```
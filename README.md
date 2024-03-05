# Graded-Assignment-on-Dockerizing-a-Plain-HTML-Page-with-Nginx
Graded Assignment on Dockerizing a Plain HTML Page with Nginx

Solution:

1. Basic HTML Page:

   - Create a plain HTML page named `index.html` with some content (e.g., "Hello, Docker!").

--> Created an index.html file

It will only print 
```
Welcome to My Website
Hello, Docker!
```

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


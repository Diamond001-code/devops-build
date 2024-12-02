# Selecting the base image
FROM nginx:alpine

# Copying build to the workdir and installing package
COPY build/ /usr/share/nginx/html


EXPOSE 80


CMD ["nginx", "-g", "daemon off;"] 

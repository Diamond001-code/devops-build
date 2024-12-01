# Selecting the base image
FROM nginx:alpine

# Copying build to the workdir and installing packages
COPY build/ /usr/share/nginx/html

# Expose port on
EXPOSE 80

# Exicuting the application after creating image
CMD ["nginx", "-g", "daemon off;"] 
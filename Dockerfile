FROM nginx:alpine
LABEL author="Jani Laakso"
COPY ./dist/simona /usr/share/nginx/html
EXPOSE 80 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]

FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html termos.html 404.html reembolso.html /usr/share/nginx/html/
EXPOSE 80

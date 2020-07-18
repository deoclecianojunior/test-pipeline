FROM nginx:latest

COPY nginx.conf /etc/nginx/

COPY localhost.iconvite.com.br.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]

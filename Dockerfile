# Passo 1: Pegar uma imagem pronta do servidor Nginx na internet
FROM nginx:alpine

# Passo 2: Copiar a nossa pasta 'app' para dentro do servidor Nginx
COPY ./app /usr/share/nginx/html

# Passo 3: Avisar que este container vai escutar a porta 80 (padrão de sites)
EXPOSE 80
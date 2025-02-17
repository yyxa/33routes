FROM node:18

WORKDIR /app

COPY . .

RUN npm install 

EXPOSE 3000

CMD ["sh", "-c", "export NODE_OPTIONS=--openssl-legacy-provider && npm start"]
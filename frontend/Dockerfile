FROM node:18

WORKDIR /app

COPY package*.json ./

ENV NODE_OPTIONS=--openssl-legacy-provider

RUN npm install 

COPY . .

EXPOSE 3000

CMD ["sh", "-c", "export NODE_OPTIONS=--openssl-legacy-provider && npm start"]
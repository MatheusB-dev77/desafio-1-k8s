FROM node:22-alpine
WORKDIR /app

# Instala as dependências primeiro, para aproveitar o cache das camadas
COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

EXPOSE 3000
USER node
CMD ["node", "server.js"]

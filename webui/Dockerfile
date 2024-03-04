FROM node:14-slim
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY files/ /app/files/
COPY webui.js /app/
EXPOSE 80
CMD ["node", "webui.js"]

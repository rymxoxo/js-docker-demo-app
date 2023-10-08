FROM node:13-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN mkdir -p /home/app/rym

COPY ./app /home/app/rym

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app/rym

# will execute npm install in /home/app because of WORKDIR
RUN npm install
RUN npm install cors

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]


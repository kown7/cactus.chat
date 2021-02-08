FROM node:lts

WORKDIR /code

COPY . /code

RUN npm install

CMD ["/code/node_modules/.bin/hugo", "server", "--bind", "0.0.0.0"]

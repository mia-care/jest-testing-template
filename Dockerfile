FROM node:iron-alpine

ARG COMMIT_SHA=<not-specified>

WORKDIR /home/node/app

COPY package*.json ./

RUN npm i

COPY . .

RUN echo "mia_template_service_name_placeholder: $COMMIT_SHA" >> ./commit.sha

RUN apk add --no-cache curl

COPY /scripts/run.sh /home/node/app/run.sh
RUN chmod +x /home/node/app/run.sh

EXPOSE 3000

CMD ["/home/node/app/run.sh"]
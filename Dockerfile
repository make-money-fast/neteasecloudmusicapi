# FROM node:20-alpine3.19
# docker tag node:20-alpine3.19 registry.cn-hangzhou.aliyuncs.com/mrjnamei/neteasecloudmusicapi:node
# docker push registry.cn-hangzhou.aliyuncs.com/mrjnamei/neteasecloudmusicapi:node
FROM registry.cn-hangzhou.aliyuncs.com/mrjnamei/neteasecloudmusicapi:node

ENV NODE_ENV production
USER node

WORKDIR /app

COPY --chown=node:node . ./

RUN yarn --network-timeout=100000

EXPOSE 3000

CMD [ "/sbin/tini", "--", "node", "app.js" ]

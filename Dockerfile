FROM node:16-alpine as builder
workdir /goodone
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /goodone/build /usr/share/nginx/htmli

CMD ["npm","run","test"]

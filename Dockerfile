
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

# FROM node:16-alpine as builder

# USER node
     
# RUN mkdir -p /home/node/app
# WORKDIR /home/node/app
     
# COPY --chown=node:node ./package.json ./
# RUN npm install
# COPY --chown=node:node ./ ./
     
# RUN npm run build


# #/app/build <--- build will be created here

# FROM nginx
# EXPOSE 80
# COPY --from=builder /home/node/app/build /usr/share/nginx/html

# #Then build and run(docker run -p 8080:80 imageId)
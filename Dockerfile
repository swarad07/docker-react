FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# Does nothing automatically.
# it is a instruction to devs to ensure this port is mapped and open
# might work on EBS directly.
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html

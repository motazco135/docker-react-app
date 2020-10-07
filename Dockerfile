#Build Phase
FROM  node:alpine 

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Run Phase we need to work with /app/build folder as it is the output of the build phase 
FROM nginx
EXPOSE 80

#her we say  copy from the prev step 0 the path /app/build to /usr/share/nginx/html
COPY --from=0 /app/build /usr/share/nginx/html
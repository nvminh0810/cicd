# Build Stage
FROM node as build
WORKDIR /app
COPY . /app
RUN npm install && npm run build

# Final Stage
FROM nginx
COPY --from=build /app/build /usr/share/nginx/html

FROM node:lts-alpine

WORKDIR /app

# Add the package.json files and install the dependencies before adding the code.
# This avoids having Docker install the dependencies every time the code changes.
COPY package*.json ./
RUN npm install

# Add the code
COPY src/ src/
COPY public/ public/
COPY README.md babel.config.js vue.config.js ./

CMD ["npm", "run", "serve"]

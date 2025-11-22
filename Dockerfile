
# Use official node LTS
FROM node:18-alpine

# Create app dir
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package.json package-lock.json* ./
RUN npm install --production

# Copy app source
COPY src ./src

# Healthcheck (optional)
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s \
  CMD wget -qO- http://localhost:3000/ || exit 1

CMD ["node", "src/index.js"]

FROM node:20

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json* pnpm-lock.yaml* ./
RUN npm install

# Copy the rest of the application
COPY . .

# Build the Astro project
RUN npm run build

# Expose the port Astro runs on
EXPOSE 4321
ENV HOST=0.0.0.0
ENV PORT=4321

# Start the Node server
CMD ["node", "./dist/server/entry.mjs"]

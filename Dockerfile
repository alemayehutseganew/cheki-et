FROM node:20-alpine

WORKDIR /app

# Copy everything into the container
COPY . .

# Install dependencies using npm (since package-lock.json is present)
RUN npm install

# Build the Next.js application
RUN npm run build

# Set environment variables for AletCloud
ENV HOSTNAME=0.0.0.0
ENV PORT=3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]

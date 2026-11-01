FROM node:20-alpine

WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

# Copy everything directly (this will find package.json wherever it is)
COPY . .

# Install dependencies and build
RUN pnpm install --frozen-lockfile || pnpm install
RUN pnpm build

# Set environment for AletCloud
ENV HOSTNAME=0.0.0.0
ENV PORT=3000
EXPOSE 3000

CMD ["pnpm", "start"]
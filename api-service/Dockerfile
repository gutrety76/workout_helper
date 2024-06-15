# Use an official Node.js runtime as a parent image
FROM node:20

# Set the working directory in the container
WORKDIR /usr/src/app

# Install netcat-openbsd for wait-for-it script
RUN apt-get update && apt-get install -y netcat-openbsd

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 3003

# Define the command to run the app with wait-for-it script

CMD ["npm", "run", "dev"]
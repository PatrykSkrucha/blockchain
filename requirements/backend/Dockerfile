# Use official Node.js image (includes npm)
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if you have one)
#COPY package*.json ./

# Install dependencies (npm is included by default in node image)
#RUN npm install

# Install Hardhat globally
RUN npm install --save-dev hardhat


# Copy rest of the app files
COPY contracts/ contracts/

# Expose port if needed (hardhat node default port is 8545)
EXPOSE 8545

# Default command to start Hardhat node or your script
# You can customize this depending on your needs
CMD ["tail", "-f", "/dev/null"]


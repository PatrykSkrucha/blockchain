require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.28",
  networks: {
    testnet: {
      url: "http://127.0.0.1:9650/ext/bc/C/rpc", // Local Avalanche C-Chain RPC
      chainId: 1337, // Match the chain ID of your local Avalanche node
      accounts: [
        "9460ee9b7aa02c0c3fc602c4f1e06ca859846fb6cce74503b40b6dd8872a5003"
      ]
    }
  },
  paths: {
    sources: "./contracts"
  }
};

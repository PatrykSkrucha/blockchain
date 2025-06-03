require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.28",
  networks: {
    testnet: {
      url: "http://127.0.0.1:9650/ext/bc/C/rpc", // Local Avalanche C-Chain RPC
      chainId: 1337, // Match the chain ID of your local Avalanche node
      accounts: [
        "b7418a4de2cbd2d33e42bebb38996165acaab44513e786f539eba7dab28144ba"
      ]
    }
  },
  paths: {
    sources: "./contracts"
  }
};

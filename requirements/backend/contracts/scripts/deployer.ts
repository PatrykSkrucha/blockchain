import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const balance = await deployer.provider.getBalance(deployer.address);
  console.log("Account balance:", balance.toString());

  const Counter = await ethers.getContractFactory("Counter");
  const counter = await Counter.deploy();
  await counter.waitForDeployment(); // Make sure deployment finishes

  const address = await counter.getAddress(); // This replaces counter.address in ethers v6
  console.log("Counter deployed to:", address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

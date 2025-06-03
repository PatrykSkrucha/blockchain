import { ethers } from "hardhat";

async function main() {
  const contractAddress = "0x14a91A0C8466925B99c1927BAe32B54177fa162b"; // Your deployed contract address

  // Get the contract factory and attach to deployed contract
  const Counter = await ethers.getContractFactory("Counter");
  const counter = Counter.attach(contractAddress);

  // Call increment()
  const tx = await counter.increment();
  await tx.wait(); // wait for the transaction to be mined

  console.log("Incremented counter");

  // Read current count
  const currentCount = await counter.count();
  console.log("Current count is:", currentCount.toString());
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });

import { ethers } from "hardhat";

async function main() {
  const contractAddress = "0xbbD15ff2a9c8d9f1420ff06eEd3D6050A22A4eBd"; // Your deployed contract address

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

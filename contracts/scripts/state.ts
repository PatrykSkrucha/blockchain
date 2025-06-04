import { ethers } from "hardhat";

async function main() {
  const contractAddress = "0xbbD15ff2a9c8d9f1420ff06eEd3D6050A22A4eBd";

  const Counter = await ethers.getContractFactory("Counter");
  const counter = Counter.attach(contractAddress);

  const currentCount = await counter.count();
  console.log("Current count is:", currentCount.toString());
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });

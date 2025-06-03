import { ethers } from "hardhat";

async function main() {
  const contractAddress = "0x14a91A0C8466925B99c1927BAe32B54177fa162b";

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

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const DEX = buildModule("DEX", (m) => {


  const dex = m.contract("DEX");

  return { dex };
});

export default DEX;

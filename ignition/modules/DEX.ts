import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const DEXModule = buildModule("DEXModule", (m) => {

  const dex = m.contract("DEX");

  return { dex };
});

export default DEXModule;

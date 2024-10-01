import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const AirdropModule = buildModule("AirdropModule", (m) => {

  const airdrop = m.contract("Airdrop");

  return { airdrop };
});

export default AirdropModule;


# ERC-1155_Airdrop

This Solidity program is an incentive smart contract that mints ERC 20 tokens and NFT to developers who sign up on their platform.

## Description

This program is a simple contract written in Solidity, a programming language for developing smart contracts. The smart contract implemented the ERC 1155 which house both the ERC 20 and ERC 721.
The smart contract made use of the 
- ```assert```
- ```require```
- ```revert```
to facilitate the airdrop process.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Airdrop.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Airdrop is ERC1155 {

    address owner;

    mapping(uint256 => string) tokenURI;

    event Size(bool);

    mapping(address => Developers) developers;

    struct Developers {
        address user;
        bool isDev;
    }

    constructor() ERC1155("") {
        owner = msg.sender;

        _setURIS();
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner");
        _;
    }

    function signUp() external {
        require(developers[msg.sender].user == address(0), "Signed Up!");

        developers[msg.sender] = Developers({user: msg.sender, isDev: true});
    }

    function airdrop(address to, uint256 id, uint256 value) external onlyOwner {
        assert(id > 0);
        if (!developers[to].isDev) revert("Not qualified for airdrop!");
        if (id == 1 && value > 1) revert("You can only mint 1 NFT");

        super._mint(to, id, value, "");

    }

    function contractURI() public pure returns (string memory) {
        return
            "https://ipfs.io/ipfs/QmfThmmntg4dKSa8EHmbRQWUkt36fzCK54EV3BeT4Ks7hE/ventura.json";
    }

    function uri(uint256 _id) public view override returns (string memory) {
        return tokenURI[_id];
    }

    function balanceOf(address account, uint256 id)
        public
        view
        override
        returns (uint256)
    {
        return super.balanceOf(account, id);
    }

    function _setURIS() private {
        tokenURI[
            1
        ] = "https://ipfs.io/ipfs/QmfThmmntg4dKSa8EHmbRQWUkt36fzCK54EV3BeT4Ks7hE/creator.json";

        tokenURI[
            2
        ] = "https://ipfs.io/ipfs/QmfThmmntg4dKSa8EHmbRQWUkt36fzCK54EV3BeT4Ks7hE/poap.json";
    }
}

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile Airdrop.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Airdrop" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it the contract.

## Authors

Michael Dean

## License

This project is licensed under the MIT License - see the LICENSE.md file for details


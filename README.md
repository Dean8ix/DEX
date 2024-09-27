
# AvalToken

This Solidity program is a simple ERC-20 smart contract that allows the owner to mint tokens for users, while users can transfer tokens between themselves and also burn their owned tokens.

## Description

This program is a simple contract written in Solidity, a programming language for developing smart contracts on the Ethereum blockchain. The smart contract imported the Openzeppelin ERC-20  and Ownable smart contract
``` javascript
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
```
and from the ERC-20 contract implemented the ```transfer```, ```mintToken``` and the ```burnToken``` functions.

- mintToken: allows only the owner of the contract to be able to mint tokens for users.
- transfer: allows a user to transfer their tokens to another user
- burnToken: allows user to check burn their no-longer-needed tokens and that will be removed from the total supply of the token in circulation.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., AvalToken.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AvalToken is ERC20, Ownable {


    constructor(string memory tokenName, string memory tokenSymbol)
        ERC20(tokenName, tokenSymbol)
        Ownable(msg.sender)
    {}

    function transfer(address to, uint256 value)
        public
        override
        returns (bool)
    {
        address owner = _msgSender();
        _transfer(owner, to, value);
        return true;
    }

    function mintToken(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function burnToken(uint96 amount) external {
        _burn(msg.sender, amount);
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.17" (or another compatible version), and then click on the "Compile AvalToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "AvalToken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it the contract.

## Authors

Rilwan Oyewole

## License

This project is licensed under the MIT License - see the LICENSE.md file for details


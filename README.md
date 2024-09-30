
# DEX

This Solidity program is a simple Decentralized Exchange smart contract that exchange the amount of wei for dex token. 1 wei = 5 dex token. It also allows user to check the dex equivalent of their wei and also withdraw the dex token.

## Description

This program is a simple contract written in Solidity, a programming language for developing smart contracts. The smart contract implemented the 
- ```transfer```,
- ```mintToken```,
- ```burnToken``` functions.

  The smart contract has 3 functions and they are:

- ```exchange```: this function exchanges wei for dex token.
- ```withdraw```: allows a user to withdraw their dex token.
- ```getBalanceOf```: allows user to check the balance of their dex token

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., DEX.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DEX {

    mapping (address => uint256) balances;

    event Exchanged(uint256 ethValue, uint256 dexValue);

    function exchange() external payable {

        assert(msg.value > 0);
        
        uint amount = msg.value * 5;

        balances[msg.sender] += amount;

        emit Exchanged(msg.value, amount);
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
    }


    function getBalanceOf(address owner) public view returns (uint256) {
        uint bal = balances[owner];

        if (bal == 0) revert ("You do not have balance");

        return bal;
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile DEX.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "DEX" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it the contract.

## Authors

Michael Dean

## License

This project is licensed under the MIT License - see the LICENSE.md file for details


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

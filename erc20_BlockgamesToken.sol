//SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

pragma solidity ^0.8.0;

contract BlockGamesToken is ERC20 {
    address deployer;

    constructor() ERC20("BlockGameToken", "BGT") {
        _mint(msg.sender, 1000000 * 10**18);
        deployer = msg.sender;
    }

    function buyToken(address reciever, uint256 _amount) public payable {
        uint256 minimumBal = 10 * _amount; //in wei. A buyer must have a minimum of 0.001 eth for 1BGT token
        uint256 holding = balanceOf(reciever);
        require(
            holding >= minimumBal,
            "You don't have enough eth in your account"
        );
        _transfer(deployer, reciever, _amount);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Champion {
    uint256 internal constant _damage = 2;
    uint256 constant b = 8;

    function getAttackDamage() external pure returns (uint256) {
        return _damage;
    }

    function attack() external pure returns (string memory) {
        return "plof!";
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Catapult {
    uint256 internal _damage;
    uint256 constant b = 9;

    constructor(uint256 damage) {
        _damage = damage;
    }

    function getAttackDamage() external view returns (uint256) {
        return _damage;
    }

    function attack() external pure returns (string memory) {
        return "fium!";
    }
}

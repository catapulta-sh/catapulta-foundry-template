// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Trebuchet {
    uint256 internal _damage;
    uint256 constant b = 7;

    constructor(uint256 damage) {
        _damage = damage;
    }

    function getAttackDamage() external view returns (uint256) {
        return _damage;
    }

    function attack() external pure returns (string memory) {
        return "fiumba!";
    }
}

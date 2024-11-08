// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Trebuchet {
    uint256 internal _damage;
    address immutable _owner;

    event Attack(uint256 damage);
    
    error Unauthorized();

    constructor(uint256 damage, address owner) {
        _damage = damage;
        _owner = owner;
    }
    
    modifier onlyOwner() {
        if (msg.sender != _owner) revert Unauthorized();
        _;
    }

    function getAttackDamage() external view returns (uint256) {
        return _damage;
    }

    function attack() external returns (string memory) {
        emit Attack(_damage);
        return "fiumba!";
    }

    function setDamage(uint256 damage) external onlyOwner {
        _damage = damage;
    }
}

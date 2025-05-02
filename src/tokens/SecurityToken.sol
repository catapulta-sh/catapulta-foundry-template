// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract SecurityToken is ERC20, Ownable {
    // Identity Registry to store KYC/AML status
    mapping(address => bool) public identityRegistry;

    // Transfer restriction status
    bool public transfersFrozen;

    // Events
    event AddedToIdentityRegistry(address indexed investor);
    event RemovedFromIdentityRegistry(address indexed investor);
    event TransfersFrozen();
    event TransfersUnfrozen();

    constructor(
        string memory name,
        string memory symbol,
        address initialOwner
    ) ERC20(name, symbol) Ownable(initialOwner) {}

    // Modifier to check if an address is verified
    modifier onlyVerified(address _address) {
        require(identityRegistry[_address], "Identity not verified");
        _;
    }

    // Add an investor to the identity registry
    function addToIdentityRegistry(address investor) external onlyOwner {
        identityRegistry[investor] = true;
        emit AddedToIdentityRegistry(investor);
    }

    // Remove an investor from the identity registry
    function removeFromIdentityRegistry(address investor) external onlyOwner {
        identityRegistry[investor] = false;
        emit RemovedFromIdentityRegistry(investor);
    }

    // Freeze all transfers
    function freezeTransfers() external onlyOwner {
        transfersFrozen = true;
        emit TransfersFrozen();
    }

    // Unfreeze all transfers
    function unfreezeTransfers() external onlyOwner {
        transfersFrozen = false;
        emit TransfersUnfrozen();
    }

    // Mint new tokens (only owner)
    function mint(
        address to,
        uint256 amount
    ) external onlyOwner onlyVerified(to) {
        _mint(to, amount);
    }

    // Override transfer function to add compliance checks
    function transfer(
        address to,
        uint256 amount
    ) public override onlyVerified(msg.sender) onlyVerified(to) returns (bool) {
        require(!transfersFrozen, "Transfers are frozen");
        return super.transfer(to, amount);
    }

    // Override transferFrom function to add compliance checks
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public override onlyVerified(from) onlyVerified(to) returns (bool) {
        require(!transfersFrozen, "Transfers are frozen");
        return super.transferFrom(from, to, amount);
    }
}

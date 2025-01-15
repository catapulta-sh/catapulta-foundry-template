// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "../../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {ERC4626} from "../../lib/openzeppelin-contracts/contracts/token/ERC20/extensions/ERC4626.sol";
import {Ownable} from "../../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import {Math} from "../../lib/openzeppelin-contracts/contracts/utils/math/Math.sol";
import {IERC20} from "../../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

/// @notice EXAMPLE, DO NOT USE THIS CONTRACT IN PRODUCTION
contract TokenizedVault is ERC4626, Ownable {
    using Math for uint256;

    uint256 public managementFee; // Fee represented in basis points (1/10000)
    uint256 public constant MAX_FEE = 1000; // Maximum fee of 10% (1000 basis points)
    uint256 private constant BASIS_POINTS = 10000;

    error FeeTooHigh();

    constructor(IERC20 asset_, string memory name_, string memory symbol_, uint256 initialFee_)
        ERC4626(asset_)
        ERC20(name_, symbol_)
        Ownable(msg.sender)
    {
        if (initialFee_ > MAX_FEE) revert FeeTooHigh();
        managementFee = initialFee_;
    }

    function setManagementFee(uint256 newFee) external onlyOwner {
        if (newFee > MAX_FEE) revert FeeTooHigh();
        managementFee = newFee;
    }

    function totalAssets() public view virtual override returns (uint256) {
        uint256 totalAssetsValue = super.totalAssets();
        uint256 feeAmount = (totalAssetsValue * managementFee) / BASIS_POINTS;
        return totalAssetsValue - feeAmount;
    }

    function _deposit(address caller, address receiver, uint256 assets, uint256 shares) internal virtual override {
        super._deposit(caller, receiver, assets, shares);

        // Transfer management fee to owner
        uint256 feeAmount = (assets * managementFee) / BASIS_POINTS;
        if (feeAmount > 0) {
            IERC20(asset()).transfer(owner(), feeAmount);
        }
    }

    function _withdraw(address caller, address receiver, address owner_, uint256 assets, uint256 shares)
        internal
        virtual
        override
    {
        super._withdraw(caller, receiver, owner_, assets, shares);

        // Apply fee on withdrawal
        uint256 feeAmount = (assets * managementFee) / BASIS_POINTS;
        if (feeAmount > 0) {
            IERC20(asset()).transfer(owner(), feeAmount);
        }
    }
}

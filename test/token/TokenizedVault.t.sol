// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {TokenizedVault} from "../../src/tokens/TokenizedVault.sol";
import {ERC20} from "../../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {IERC20} from "../../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract MockERC20 is ERC20 {
    constructor() ERC20("Mock Token", "MTK") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}

contract TokenizedVaultTest is Test {
    TokenizedVault public vault;
    MockERC20 public asset;
    address public owner;
    address public user1;
    address public user2;

    uint256 constant INITIAL_DEPOSIT = 1000 * 1e18;
    uint256 constant INITIAL_FEE = 100; // 1% fee

    function setUp() public {
        owner = address(this);
        user1 = address(0x1);
        user2 = address(0x2);

        // Deploy mock asset token
        asset = new MockERC20();

        // Deploy vault
        vault = new TokenizedVault(IERC20(address(asset)), "Vault Token", "vTKN", INITIAL_FEE);

        // Transfer initial tokens to users
        asset.transfer(user1, INITIAL_DEPOSIT);
        asset.transfer(user2, INITIAL_DEPOSIT);
    }

    function testInitialState() public {
        assertEq(vault.managementFee(), INITIAL_FEE);
        assertEq(address(vault.asset()), address(asset));
    }

    function testDeposit() public {
        uint256 depositAmount = 100 * 1e18;

        vm.startPrank(user1);
        asset.approve(address(vault), depositAmount);

        uint256 expectedShares = vault.previewDeposit(depositAmount);
        uint256 shares = vault.deposit(depositAmount, user1);

        assertEq(shares, expectedShares);
        assertEq(vault.balanceOf(user1), shares);
        vm.stopPrank();
    }

    function testWithdraw() public {
        uint256 depositAmount = 100 * 1e18;

        vm.startPrank(user1);
        asset.approve(address(vault), depositAmount);
        uint256 shares = vault.deposit(depositAmount, user1);

        uint256 expectedAssets = vault.previewRedeem(shares);
        uint256 withdrawnAssets = vault.redeem(shares, user1, user1);

        assertEq(withdrawnAssets, expectedAssets);
        assertEq(vault.balanceOf(user1), 0);
        vm.stopPrank();
    }

    function testManagementFee() public {
        uint256 depositAmount = 100 * 1e18;
        uint256 expectedFee = (depositAmount * INITIAL_FEE) / 10000;

        uint256 initialOwnerBalance = asset.balanceOf(owner);

        vm.startPrank(user1);
        asset.approve(address(vault), depositAmount);
        vault.deposit(depositAmount, user1);
        vm.stopPrank();

        assertEq(asset.balanceOf(owner) - initialOwnerBalance, expectedFee);
    }

    function testSetManagementFee() public {
        uint256 newFee = 200; // 2%
        vault.setManagementFee(newFee);
        assertEq(vault.managementFee(), newFee);
    }

    function testSetManagementFeeTooHigh() public {
        uint256 tooHighFee = 1100; // 11%

        vm.expectRevert(TokenizedVault.FeeTooHigh.selector);
        vault.setManagementFee(tooHighFee);
    }
}

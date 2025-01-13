// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {MyNFT} from "../../src/tokens/MyNFT.sol";

contract MyNFTTest is Test {
    MyNFT public nft;
    address public owner;
    address public user;
    string public constant INITIAL_BASE_URI = "ipfs://baseuri/";

    function setUp() public {
        owner = makeAddr("owner");
        user = makeAddr("user");
        vm.prank(owner);
        nft = new MyNFT("MyNFT", "MNFT", INITIAL_BASE_URI);
    }

    function testMint() public {
        vm.deal(user, 1 ether);
        vm.prank(user);
        nft.mint{value: 0.01 ether}();

        assertEq(nft.balanceOf(user), 1);
        assertEq(nft.ownerOf(0), user);
    }

    function testFailMintWithoutPayment() public {
        vm.prank(user);
        nft.mint();
    }

    function testWithdraw() public {
        // First mint an NFT to add funds to contract
        vm.deal(user, 1 ether);
        vm.prank(user);
        nft.mint{value: 0.01 ether}();

        // Check owner can withdraw
        uint256 initialBalance = owner.balance;
        vm.prank(owner);
        nft.withdraw();
        assertEq(owner.balance - initialBalance, 0.01 ether);
    }

    function testSetMintPrice() public {
        vm.prank(owner);
        nft.setMintPrice(0.02 ether);
        assertEq(nft.mintPrice(), 0.02 ether);
    }

    function testFailNonOwnerSetMintPrice() public {
        vm.prank(user);
        nft.setMintPrice(0.02 ether);
    }

    function testSetBaseURI() public {
        string memory newBaseURI = "ipfs://newbaseuri/";
        vm.prank(owner);
        nft.setBaseURI(newBaseURI);

        // Mint a token to test the new baseURI
        vm.deal(user, 1 ether);
        vm.prank(user);
        nft.mint{value: 0.01 ether}();

        assertEq(nft.baseTokenURI(), newBaseURI);
    }

    function testFailNonOwnerSetBaseURI() public {
        vm.prank(user);
        nft.setBaseURI("ipfs://newbaseuri/");
    }
}

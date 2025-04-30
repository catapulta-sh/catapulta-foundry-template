// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {NFT} from "../src/tokens/NFT.sol";

contract DeployNFT is Script {
    function run() external {
        string memory initialBaseURI = "ipfs://baseuri/";

        vm.startBroadcast();

        new NFT("NFT Art", "ART", initialBaseURI);

        vm.stopBroadcast();
    }
}

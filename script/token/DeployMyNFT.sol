// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MyNFT} from "../../src/tokens/MyNFT.sol";

contract DeployMyNFT is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        string memory initialBaseURI = "ipfs://baseuri/";

        vm.startBroadcast(deployerPrivateKey);

        new MyNFT("MyNFT", "MNFT", initialBaseURI);

        vm.stopBroadcast();
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {SecurityToken} from "../../src/tokens/SecurityToken.sol";

contract DeploySecurityToken is Script {
    function run() external {
        // Retrieve private key from environment
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Start broadcasting transactions
        vm.startBroadcast(deployerPrivateKey);

        // Deploy the token
        SecurityToken token = new SecurityToken(
            "Security Token",
            "STKN",
            vm.addr(deployerPrivateKey)
        );

        vm.stopBroadcast();
    }
}

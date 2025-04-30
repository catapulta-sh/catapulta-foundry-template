// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {ERC20Token} from "../src/tokens/ERC20Token.sol";

contract DeployERC20 is Script {
    function run() public {
        vm.startBroadcast();

        new ERC20Token(1_000_000e18);
        
        vm.stopBroadcast();
    }
}

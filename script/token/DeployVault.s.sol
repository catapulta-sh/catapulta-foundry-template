// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {TokenizedVault} from "../../src/tokens/TokenizedVault.sol";
import {IERC20} from "../../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract DeployVault is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address assetToken = vm.envAddress("ASSET_TOKEN_ADDRESS");

        vm.startBroadcast(deployerPrivateKey);

        TokenizedVault vault = new TokenizedVault(
            IERC20(assetToken),
            "Vault Token",
            "vTKN",
            100 // 1% initial fee
        );

        vm.stopBroadcast();

        console.log("Vault deployed at:", address(vault));
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

// ⚠️ warning - Please Don't use this contract in production
contract Lottery {
    address public owner;
    address[] public players;
    uint256 public ticketPrice = 0.001 ether;

    constructor() {
        owner = msg.sender;
    }

    function enter() public payable {
        require(msg.value == ticketPrice, "Wrong ticket price");
        players.push(msg.sender);
    }

    function pickWinner() public {
        require(msg.sender == owner, "Only owner can pick winner");
        require(players.length > 0, "No players");

        uint256 random = uint256(
            keccak256(abi.encodePacked(block.timestamp, block.prevrandao))
        );
        uint256 index = random % players.length;

        address winner = players[index];
        payable(winner).transfer(address(this).balance);

        // Reset the lottery
        delete players;
    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }
}

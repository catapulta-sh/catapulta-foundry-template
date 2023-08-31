# <h1 align="center"> Catapulta.sh Forge Template </h1>

Template repository for getting started quickly with [Catapulta.sh](https://catapulta.sh/docs) Chain Ops Suite for Foundry projects.

Requirements
- [Git](https://gist.github.com/derhuerst/1b15ff4652a867391f03)
- [Node.js 18v](https://gist.github.com/d2s/372b5943bce17b964a79)
- Catapulta API Key, register for free and create a new project in the [Catapulta dashboard](https://catapulta.sh)

You don't need to setup RPC URLs or Etherscan API keys, `catapulta` takes care of all configuration.

## Getting Started

Click "Use this template" on [GitHub](https://github.com/catapulta-sh/catapulta-forge-template) to create a new repository with this repo as the initial state.

## Deploy your first contract with Catapulta
1. Git clone this repository and enter to the repository directory:
```
git clone https://github.com/catapulta-sh/catapulta-forge-template
cd catapulta-forge-template
```
2. Generate a new private key
```
npx catapulta wallet

# Output:
# Wallet address: 0x6B193d5604e09f1737E33cFc4B06fb3f2C7fC3CE
# Private key appended to your .env file.
```
3. Get funds for your Ethereum address with the [Alchemy Sepolia faucet](https://sepoliafaucet.com/) 
4. Deploy the basic contract into Sepolia testnet with Catapulta
```
npx catapulta script --deployment-path scripts/DeployBasic.sol --chain 11155111
```

## Development

This project uses [Foundry](https://getfoundry.sh) and [Catapulta](https://catapulta.sh/docs). See the [book](https://book.getfoundry.sh/getting-started/installation.html) for instructions on how to install and use Foundry.

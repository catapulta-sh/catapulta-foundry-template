# <h1 align="center"> Catapulta.sh Forge Template </h1>

Template repository for getting started quickly with [Catapulta.sh](https://catapulta.sh/docs) Chain Ops Suite for Foundry projects.

Requirements

- [Git](https://gist.github.com/derhuerst/1b15ff4652a867391f03)
- [Node.js 18v](https://gist.github.com/d2s/372b5943bce17b964a79)

## Getting Started

Click "Use this template" on [GitHub](https://github.com/catapulta-sh/catapulta-forge-template) to create a new repository with this repo as the initial state.

## Deploy your first contract with Catapulta

1. Git clone this repository and enter to the repository directory:

```
git clone https://github.com/catapulta-sh/catapulta-forge-template
cd catapulta-forge-template
```

2. Install forge dependencies, forge-std

```
forge install
```

3. Generate a new private key with Catapulta, is stored offline in your .env

```
npx catapulta wallet

# Output:
# Wallet address: 0x6B193d5604e09f1737E33cFc4B06fb3f2C7fC3CE
# Private key appended to your .env file.
```

4. Get funds for your Ethereum address at the [Alchemy Sepolia faucet](https://sepoliafaucet.com/)
5. Get your `CATAPULTA_API_KEY` into your .env from, generate one at [Catapulta dashboard](https://catapulta.sh)
6. Deploy the basic contract into Sepolia testnet with Catapulta

```
npx catapulta script --deployment-path scripts/DeployBasic.sol --chain 11155111
```

7. Check the deployment report at the Catapulta UI, and enjoy delegated Etherscan verification without any extra configs or API keys.

![Uploading basic 2.png…]()


## Development

This project uses [Foundry](https://getfoundry.sh) and [Catapulta](https://catapulta.sh/docs). See the [book](https://book.getfoundry.sh/getting-started/installation.html) for instructions on how to install and use Foundry.

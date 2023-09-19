# <h1 align="center"> Catapulta.sh Forge Template </h1>

Template repository for getting started quickly with [Catapulta.sh](https://catapulta.sh/docs) Chain Ops Suite for Foundry projects.

Requirements

- [Git](https://gist.github.com/derhuerst/1b15ff4652a867391f03)
- [Node.js 18v](https://gist.github.com/d2s/372b5943bce17b964a79)
- [Foundry](https://book.getfoundry.sh/)

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

3. Generate a new private key with Catapulta, is stored offline in your .env, or add your own as `PRIVATE_KEY` in the .env file stored at the root of the project

```
npx catapulta wallet

# Output:
# Wallet address: 0x6B193d5604e09f1737E33cFc4B06fb3f2C7fC3CE
# Private key appended to your .env file.
```

4. Get funds for your Ethereum address at the [Alchemy Sepolia faucet](https://sepoliafaucet.com/)
5. Setup your `CATAPULTA_API_KEY` into your .env, generate one at [Catapulta dashboard](https://catapulta.sh)
6. Deploy the basic contract into Sepolia testnet with Catapulta

```
npx catapulta script scripts/DeployBasic.sol --network sepolia
```

7. Check the deployment report at the Catapulta UI, and enjoy delegated Etherscan verification without any extra configs or API keys.

![basic 2](https://github.com/catapulta-sh/catapulta-forge-template/assets/11179847/9b2c830b-ab4e-4da6-b3c0-e515639cc47b)


## Development

This project uses [Foundry](https://getfoundry.sh) and [Catapulta](https://catapulta.sh/docs). See the [book](https://book.getfoundry.sh/getting-started/installation.html) for instructions on how to install and use Foundry.

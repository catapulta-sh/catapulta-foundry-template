# <h1 align="center"> Catapulta.sh Foundry Template </h1>

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
5. Setup your `CATAPULTA_API_KEY` into your .env, generate one free key at [Catapulta](https://catapulta.sh/auth)
6. Deploy the basic contract into Sepolia testnet with Catapulta

```
npx catapulta script scripts/DeployBasic.sol --network sepolia
```

```
# Output:
Catapulta.sh 🏏 Forge script deployment (0.1.36)
================================================
Project name: Ghost Deployments
Project URL: https://catapulta.sh/project/6116272a59b37a3a4a7afb55
Deployment UUID: 592a91ad-57c8-42c6-b37e-2af0e170f31a

📀 Building artifacts...

🗜  Compressing artifacts...

📤 Uploading artifacts to the Catapulta DB...

✅ Artifacts uploaded successfully.

📡 Broadcasting deployments to Catapulta Gateway RPC:

📜 Running Foundry script: forge script scripts/DeployBasic.sol  --rpc-url "https://catapulta.sh/api/run/add/chain/11155111/5922a91ad2-57c8242c6-b37e-2af0e170f31a/gNd4vq8AqnRWhxwPJiMS" --broadcast --chain-id 11155111

.
Compiling 2 files with 0.8.19

Solc 0.8.19 finished in 623.73ms

Compiler run successful!

[...]

==========================

ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.

Total Paid: 0.000852774003979612 ETH (284258 gas * avg 3.000000014 gwei)


✅ Deployment successfully broadcasted

- Etherscan verification request sent. Check the dashboard for keeping track of verifications. If contracts are not verified in 10 minutes, contact support at Discord.

💾 Artifacts stored at:
- https://users-artifacts.s3.eu-west-1.amazonaws.com/595a911d-57c8-42c6-b37e-2af0e170f31a-deployment-artifacts/artifacts.zip

📸 Check your deployment report at:
 - https://catapulta.sh/project/6416272a59b37a3a4a7afb55/op/595a91ad-57c8-42c6-b37e-2af0e170f31a
```

7. Check the deployment report at the Catapulta UI, and enjoy delegated Etherscan verification without any extra configs or API keys.

![basic 2](https://github.com/catapulta-sh/catapulta-forge-template/assets/11179847/9b2c830b-ab4e-4da6-b3c0-e515639cc47b)

## Development

This project uses [Foundry](https://getfoundry.sh) and [Catapulta](https://catapulta.sh/docs). See the [book](https://book.getfoundry.sh/getting-started/installation.html) for instructions on how to install and use Foundry.

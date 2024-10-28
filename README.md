# <h1 align="center"> Catapulta.sh Foundry Template</h1>
Template repository for getting started quickly with [Catapulta.sh](https://catapulta.sh/docs) Chain Ops Suite for Foundry projects.





## Getting Started - Dev Container
Install this Catapulta Foundry template as a Dev Container in your Cursor or VSCode IDE with 1-click:

[![Dev Containers](https://img.shields.io/static/v1?label=Dev%20Containers&message=Open%20in%20Cursor&color=black&logo=visualstudiocode)](https://tinyurl.com/25msv9bd)

[![Dev Containers](https://img.shields.io/static/v1?label=Dev%20Containers&message=Open%20in%20VSCode&color=blue&logo=visualstudiocode)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/catapulta-sh/catapulta-foundry-template)



## Getting Started - Git

Requirements

- [Git](https://gist.github.com/derhuerst/1b15ff4652a867391f03)
- [Node.js](https://gist.github.com/d2s/372b5943bce17b964a79)
- [Foundry](https://book.getfoundry.sh/)

Click "Use this template" on [GitHub](https://github.com/catapulta-sh/catapulta-foundry-template) to create a new repository with this repo as the initial state.

You can also git clone this repository and enter to the repository directory:

```
git clone https://github.com/catapulta-sh/catapulta-foundry-template
cd catapulta-foundry-template
```

## Deploy your first contract with Catapulta

1. Install forge dependencies

```
forge install
```

2. Install catapulta via `npm`

```
npm i -g catapulta
```

3. Generate a new private key with Catapulta, is stored offline in your .env, or add your own as `PRIVATE_KEY` in the .env file stored at the root of the project

```
catapulta wallet

# Output:
# Wallet address: 0x6B193d5604e09f1737E33cFc4B06fb3f2C7fC3CE
# Private key appended to your .env file.
```
4. Setup your `CATAPULTA_API_KEY` into your .env, generate one free key at [Catapulta](https://catapulta.sh/auth)
5. Deploy the basic contract into Sepolia testnet with Catapulta, using `--sponsor` flag to request gas. This skips the need of faucets.

```
catapulta script script/Deploy.s.sol --network baseSepolia --sponsor
```

```
# Output:
Catapulta.sh 🏏 Forge script deployment (0.4.1)
================================================
Project name: Ghost Deployments
Project URL: https://catapulta.sh/project/6116272a59b37a3a4a7afb55
Deployment UUID: 592a91ad-57c8-42c6-b37e-2af0e170f31a

📀 Building artifacts...

🗜  Compressing artifacts...

📤 Uploading artifacts to the Catapulta DB...

✅ Artifacts uploaded successfully.

📡 Broadcasting deployments to Catapulta Gateway RPC:

📜 Running Foundry script: forge script scripts/DeployBasic.sol --broadcast

[...]

✅ Deployment successfully broadcasted

- Etherscan verification request sent. Check the dashboard for keeping track of verifications. If contracts are not verified in 10 minutes, contact support at Discord.

💾 Artifacts stored at:
- https://users-artifacts.s3.eu-west-1.amazonaws.com/595a911d-57c8-42c6-b37e-2af0e170f31a-deployment-artifacts/artifacts.zip

📸 Check your deployment report at:
 - https://catapulta.sh/project/6416272a59b37a3a4a7afb55/op/595a91ad-57c8-42c6-b37e-2af0e170f31a
```

7. Check the deployment report at the Catapulta UI, and enjoy automated Etherscan verification without any extra configs or API keys.

![Report Latest](https://github.com/catapulta-sh/catapulta-foundry-template/assets/11179847/b34f165c-1846-4ae7-b0cb-c6493460a558)

## Development

This project uses [Foundry](https://getfoundry.sh) and [Catapulta](https://catapulta.sh/docs).

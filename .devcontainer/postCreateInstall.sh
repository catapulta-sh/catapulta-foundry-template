#!/bin/bash

# Install foundryup and forge
curl -L https://foundry.paradigm.xyz | bash
export PATH="$PATH:/home/vscode/.foundry/bin"
foundryup

# Install Catapulta CLI globally
npm i -g catapulta

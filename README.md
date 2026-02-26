# Ultimate Finance

Ultimate Finance is a Starknet-native BTC Yield Vault designed to help Bitcoin holders earn sustainable yield without exposure to lending defaults or custodial risk.

Instead of rehypothecation or undercollateralized lending, Ultimate Finance deploys BTC into transparent delta-neutral strategies such as funding rate capture and liquidity provisioning.

---

## 🚀 Vision

Bitcoin should be productive without being risky.

Ultimate Finance enables BTC holders to:

- Earn yield
- Maintain exposure to BTC
- Avoid lending platforms
- Verify strategy solvency transparently

---

## 🧠 Core Concept

Users deposit BTC → receive vault shares → capital is deployed into market-neutral yield strategies.

Yield sources include:

- Perpetual funding rate arbitrage
- Liquidity provision with hedging
- Basis capture

All strategies aim to remain delta-neutral.

---

## 🏗 Architecture

### Components

| Module | Description |
|--------|-------------|
| Vault Contract | Accepts BTC deposits and manages shares |
| Strategy Engine | Deploys capital into yield strategies |
| Proof Module | Tracks solvency & allocation |
| Mock BTC | Used for testing & hackathon demo |
| Faucet | Provides test BTC to users |

---

## 🔐 Safety Principles

Ultimate Finance avoids:

- ❌ Under-collateralized lending
- ❌ Custodial risk
- ❌ Rehypothecation

Focus:

- ✅ Market-neutral yield
- ✅ Transparent allocation
- ✅ On-chain accounting

---

## 🪙 Mock BTC

We use a mock BTC token for testing and demo purposes.

Location:


# Ultimate Finance

Ultimate Finance is a Starknet-native BTC Yield Vault that enables Bitcoin holders to earn sustainable yield without lending risk, rehypothecation, or custodial exposure.

The protocol deploys BTC into transparent delta-neutral strategies while providing verifiable solvency through a ZK transparency layer.

---

## Vision

Bitcoin should be productive without being risky.

Ultimate Finance enables:

* Sustainable BTC yield
* Strategy transparency
* Proof of solvency
* Non-custodial exposure

---

## Architecture

### Core Modules

Vault
Handles deposits, withdrawals, and share accounting

Strategy Engine
Simulates funding-rate capture yield

ZK Transparency Layer
Tracks solvency state and enables future ZK proofs

Mock BTC
Testing token with faucet

---

## Flow

Deposit → Deploy → Yield → Harvest → Verify → Withdraw

---

## ZK Transparency

Each harvest updates the solvency module.

Vault Assets ≥ Strategy Capital

This allows future integration with real ZK proofs.

---

## Project Structure

```
src/
 ├── vault.cairo
 ├── strategy.cairo
 ├── zk_proof.cairo

tests/
mocks/
ui/
```

---

## UI Structure

```
ui/src/
 ├── abi/
 ├── hooks/
 ├── pages/
 ├── components/
 ├── config.ts
 └── App.tsx
```

---

## Running Contracts

Install:

Scarb
Starknet Foundry
Starkli

Build:

```
scarb build
```

Test:

```
snforge test
```

Deploy:

```
starkli deploy <vault>
```

---

## Running UI

```
cd ui
npm install
npm run dev
```

---

## Demo Flow

1. Connect Wallet
2. Mint BTC
3. Deposit
4. Deploy
5. Harvest
6. Verify Solvency
7. Withdraw Profit

---

## Innovation

Ultimate Finance demonstrates how BTCFi can combine:

* Market-neutral yield
* Starknet execution
* ZK solvency guarantees

---

Built for Starknet Re{defi}ne Hackathon

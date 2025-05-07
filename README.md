# 🪙 KAYKAY (KK) – A Simple ERC-20 Token

KAYKAY (KK) is a basic ERC-20 token built with Solidity using OpenZeppelin’s secure and battle-tested libraries. It follows the standard token pattern and can be used for testing, learning, or integration into dApps.

---

## 🔍 Overview

* ERC-20 compatible token
* Built using OpenZeppelin Contracts
* Includes basic token functionality: transfer, balance check, allowance, etc.
* Fully deployed to the Ethereum Sepolia Testnet
* Easy to extend for custom logic

---

## 📦 Features

* ✅ Standard ERC-20 functions (`transfer`, `approve`, `transferFrom`, `balanceOf`, `totalSupply`)
* ✅ Built on OpenZeppelin's secure contract libraries
* ✅ Custom token name (`KAYKAY`) and symbol (`KK`)
* ✅ Fixed total supply (you define it during deployment)
* ✅ Easily extendable for burning, minting, and pausing features

---

## 🧰 Dependencies

* [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)
* Solidity ^0.8.0
* Foundry (for development and testing)

---

## 🛠 Deployment

### Constructor Example

```solidity
constructor(uint256 initialSupply) ERC20("KayKay", "KK") {
    _mint(msg.sender, initialSupply);
}
```

This creates a token named **KAYKAY**, with symbol **KK**, and mints `1,000 KK` tokens to the deployer.

---

## ✨ Usage

After deployment, users can:

* 📤 Send tokens to other addresses
* 🔒 Approve other addresses to spend tokens
* 🔁 Use `transferFrom` for delegated transfers
* 📊 Check balances and total supply

---

## 🔓 Access Control

Currently, only the deployer mints tokens at deployment. No special owner functions are included unless you extend it (e.g., Ownable, Mintable, Burnable).

---

## 📘 To-Do / Future Improvements

* Add **burnable** or **mintable** features
* Add **pausable** functionality for emergency stops
* Integrate with **frontend UI**
* Deploy to **mainnet or other testnets**
* Use **Ownable** for admin control

---

## 📝 License

MIT License

---

## 🙌 Acknowledgements

Built with 💛 using [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts) and [Foundry](https://github.com/foundry-rs/foundry)

---


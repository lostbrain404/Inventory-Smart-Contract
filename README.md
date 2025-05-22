# 📦 Inventory Smart Contract

A smart contract written in Solidity to manage products using a unique identifier for each product. It allows the owner to add, update, and remove products while maintaining security through access control.

---

## 🛠️ Core Functions

### ✅ `setProduct(uint64 identify, string memory name)`
- Adds a new product.
- Duplicate identifiers are not allowed.
- 🔒 Requires owner access (`onlyOwner`).

### 📥 `getProduct(uint64 identify) → string`
- Returns the product name based on the ID.
- ❗ Fails if the product does not exist.

### ❌ `removeProduct(uint64 identify)`
- Disables the product (soft delete).
- 🔒 Requires owner access.

### ✏️ `updateProductName(uint64 identify, string memory newName)`
- Updates the name of an existing product.
- 🔒 Requires owner access.

---

## 📡 Events

- `UpdatedProduct(uint64 id, string name)`  
- `DeletedProduct(uint64 id, string name)`  
- `ProductNameUpdated(uint64 id, string newName)`

---

## 🔐 Permissions

- Only the **contract owner** can modify the products (add, delete, update).
- Ownership is set in the constructor.

---

## 🧪 Test Requirements

- Ensure duplicate product IDs are rejected.
- Ensure non-owners cannot add, delete, or update products.
- Ensure `getProduct` fails for non-existing products.

---

## 🧱 Setup

```bash
npm install --save-dev hardhat
```

Start your project with:

```bash
npx hardhat
```

Then place this contract inside the `contracts/Inventory.sol` directory.

---

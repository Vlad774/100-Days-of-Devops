# 🔐 GPG Encryption & Decryption (SecOps)

## 📄 Task Description
The goal is to secure confidential data transfer using **GPG (GNU Privacy Guard)** asymmetric encryption. We need to encrypt outgoing data and decrypt incoming data using a public/private key pair.

### Requirements:
1.  **Server:** Storage Server (`ststor01`)
2.  **Keys Location:** `/home/*_key.asc`
3.  **Passphrase:** `kodekloud`
4.  **Tasks:**
    * **Encrypt:** `/home/encrypt_me.txt` ➡️ `/home/encrypted_me.asc` (Target User: `kodekloud@kodekloud.com`)
    * **Decrypt:** `/home/decrypt_me.asc` ➡️ `/home/decrypted_me.txt`

---

## 🏗️ Workflow Diagram

```mermaid
graph TD
    subgraph Key_Management [1. Key Import]
        PubKey(Public Key) --> KeyRing[(GPG Keyring)]
        PrivKey(Private Key) --> KeyRing
    end

    subgraph Encryption_Flow [2. Encryption Process]
        FilePlain[/encrypt_me.txt/]
        KeyRing -.->|Use Public Key| EncryptProcess(GPG Encrypt)
        FilePlain --> EncryptProcess
        EncryptProcess --> FileEnc[/encrypted_me.asc/]
    end

    subgraph Decryption_Flow [3. Decryption Process]
        FileInEnc[/decrypt_me.asc/]
        Pass(Passphrase: kodekloud) -.-> DecryptProcess(GPG Decrypt)
        KeyRing -.->|Use Private Key| DecryptProcess
        FileInEnc --> DecryptProcess
        DecryptProcess --> FileOutPlain[/decrypted_me.txt/]
    end

    style Key_Management fill:#f9f,stroke:#333,stroke-width:2px
    style Encryption_Flow fill:#e1f5fe,stroke:#333,stroke-width:2px
    style Decryption_Flow fill:#e8f5e9,stroke:#333,stroke-width:2px
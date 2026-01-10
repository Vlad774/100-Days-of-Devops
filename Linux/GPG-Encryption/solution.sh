#!/bin/bash
# GPG Encryption/Decryption Solution
# Note: Keys must be imported separately via 'gpg --import' before running.

# 1. Encrypt
# Assuming public key for 'kodekloud@kodekloud.com' is imported
gpg --encrypt --recipient kodekloud@kodekloud.com --armor --output /home/encrypted_me.asc /home/encrypt_me.txt

# 2. Decrypt
# Using batch mode to pass passphrase securely (or interactively without --batch)
gpg --batch --passphrase kodekloud --output /home/decrypted_me.txt --decrypt /home/decrypt_me.asc
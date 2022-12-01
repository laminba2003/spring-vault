#!/bin/bash
VAULT_RETRIES=6
echo "Vault is starting..."
until vault status > /dev/null 2>&1 || [ $VAULT_RETRIES -eq 0 ]; do
echo "Waiting for vault to start...$((VAULT_RETRIES=VAULT_RETRIES-1))"
sleep 1
done
echo "Authenticating to vault..."
vault login token=vault-plaintext-root-token
echo "Initializing vault..."
vault secrets enable -version=2 -path=spring-vault kv
echo "Adding entries..."
vault kv put secret/spring-vault/dev spring.datasource.username=user spring.datasource.password=user
echo "Complete..."
#!/bin/bash
VAULT_RETRIES=6
echo "Vault client is starting..."
until vault status > /dev/null 2>&1 || [ $VAULT_RETRIES -eq 0 ]; do
echo "Trying to connect to Vault server...$((VAULT_RETRIES=VAULT_RETRIES-1))"
sleep 1
done
echo "Authenticating to Vault server..."
vault login token=vault-plaintext-root-token
vault secrets enable -version=2 -path=spring-vault kv
echo "Adding entries..."
vault kv put secret/spring-vault/dev spring.datasource.username=user spring.datasource.password=user
echo "Operation Complete..."
# Spring Vault

Vault is a software which provides secure secret management to protect sensitive data. 
Secrets may be anything from text properties or data to tokens, passwords, X509 certificates, and both symmetric and asymmetric keys used for encryption, authentication, and signing. Vault is API driven and can be used with standard REST API client software or their built in CLI tools, or even the Vault UI.

## Start the vault server

run this command to start all services in the correct order.

```bash
$ docker-compose up -d
```

## Run the application

```
mvn spring-boot:run
```

## Stop the vault server

```bash
docker-compose down
```

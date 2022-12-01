# Spring Vault

Vault is a software which provides secure secret management to protect sensitive data. 
Secrets may be anything from text properties or data to tokens, passwords, X509 certificates, and both symmetric and asymmetric keys used for encryption, authentication, and signing. Vault is API driven and can be used with standard REST API client software, or their built in CLI tools, or even the Vault UI.

## Setup

### pom.xml

```xml
<dependencies>
    <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-vault-config</artifactId>
    </dependency>
</dependencies>
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-dependencies</artifactId>
            <version>${spring-cloud.version}</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
```

### application.yml

```yaml
spring:
  application:
    name: spring-vault
  cloud:
    vault:
      uri: http://localhost:8200
      authentication: TOKEN
      token: ${VAULT_TOKEN}
      connection-timeout: 5000
      read-timeout: 15000
      kv:
        enabled: true
  config:
    import: vault://
```

## Start the vault server

run this command to start all services in the correct order.

```bash
$ docker-compose up -d
```

## Run the application

You need to run the project with the appropriate profile.

```
mvn spring-boot:run -Dspring-boot.run.profiles=dev
```

## Stop the vault server

```bash
docker-compose down
```

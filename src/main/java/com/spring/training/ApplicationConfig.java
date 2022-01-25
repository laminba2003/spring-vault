package com.spring.training;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import javax.sql.DataSource;

@Configuration
public class ApplicationConfig {

    @Bean
    @ConfigurationProperties(prefix = "database")
    public DatabaseConfig databaseConfig() {
        return new DatabaseConfig();
    }

    @Bean
    @Primary
    public DataSource dataSource(DatabaseConfig databaseConfig) {
        return DataSourceBuilder.create().username(databaseConfig.getUserName())
                .password(databaseConfig.getPassword())
                .url(databaseConfig.getUrl())
                .driverClassName("com.mysql.cj.jdbc.Driver").build();
    }
}
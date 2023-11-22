package com.ruoyi.liquibase;

import liquibase.integration.spring.SpringLiquibase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.liquibase.LiquibaseProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 * @version V1.0
 * @Package com.ruoyi.framework.config
 * @ClassName liquibaseConfig
 * @Description TODO
 **/
@Configuration
public class liquibaseConfig {



        private DataSource dataSource;

        @Bean
        public SpringLiquibase liquibase() {
            SpringLiquibase liquibase = new SpringLiquibase();
            liquibase.setDataSource(dataSource);
            liquibase.setChangeLog("classpath:liquibase/liquibase.xml");
            liquibase.setContexts("development,test,preproduction,production");
            liquibase.setShouldRun(true);
            return liquibase;
        }

        @Autowired
        @Qualifier("dynamicDataSource")
        public void setDataSource(DataSource dataSource) {
            this.dataSource = dataSource;
        }

}

package com.gjsyoung.eiaproject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

//启动入口
@SpringBootApplication
public class EiaprojectApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(EiaprojectApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(EiaprojectApplication.class, args);
	}

}


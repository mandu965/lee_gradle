package lee.main.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "lee.main.repository")
public class Index {
	public static void main(String[] args) {
		System.out.println("#############################################");
        SpringApplication.run(Index.class);
    }

}

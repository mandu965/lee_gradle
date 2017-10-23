package lee.main.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "lee.main") //mpperScan 적용방법 확인
public class Index {
	public static void main(String[] args) {
        SpringApplication.run(Index.class);
    }

}
//@SpringBootApplication = @Configuration + @EnableAutoConfiguration + @ComponentScan
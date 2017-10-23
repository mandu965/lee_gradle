package lee.main;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@MapperScan(basePackages = "lee.main") //mpperScan ������ Ȯ��
@ComponentScan 
public class Index {
	public static void main(String[] args) {
        SpringApplication.run(Index.class);
    }

}
//@SpringBootApplication = @Configuration + @EnableAutoConfiguration + @ComponentScan
package lee;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@MapperScan(basePackages = {"lee"}) //mpperScan search
//@ComponentScan({"lee.main, lee.join, lee.login, lee.comm"}) 
@ComponentScan({"lee.**"})
public class Index {
	public static void main(String[] args) {
        SpringApplication.run(Index.class);
    }

}
//@SpringBootApplication = @Configuration + @EnableAutoConfiguration + @ComponentScan
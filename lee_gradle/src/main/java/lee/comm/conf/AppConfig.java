package lee.comm.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class AppConfig extends WebMvcConfigurerAdapter {

   /* @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // TODO Auto-generated method stub
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
    }*/
   
	@Autowired
	private LeeInterceptor leeInterceptor;
	
	@Autowired
	private AdminInterceptor adminInterceptor;
	
	@Override 
	public void addInterceptors(InterceptorRegistry registry) 
	{
		registry.addInterceptor(leeInterceptor)
			.addPathPatterns("/**")
			.excludePathPatterns("/sm/**");
		
		registry.addInterceptor(adminInterceptor)
		.addPathPatterns("/sm/**")
		.excludePathPatterns("/public/**"); 
	}

}


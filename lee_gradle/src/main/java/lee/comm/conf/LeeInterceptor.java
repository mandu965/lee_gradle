package lee.comm.conf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//http://jsonobject.tistory.com/244

@Component
public class LeeInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle( HttpServletRequest request, HttpServletResponse response, Object handler ) throws Exception 
	{
		// HTTP 요청 처리 전 수행할 로직 작성 
		//System.out.println("interceptor prehandle");
		return true;
	} 
	
	@Override
	public void postHandle( HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView ) throws Exception { 
		// HTTP 요청 처리 후 수행할 로직 작성 
		//System.out.println("interceptor postHandle");
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}

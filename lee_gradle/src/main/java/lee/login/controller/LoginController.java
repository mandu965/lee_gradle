package lee.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	@RequestMapping(value = "/login/loginPro", method = RequestMethod.POST)
    public  @ResponseBody Map usrAddPro(HttpServletRequest req) {
		System.out.println("loginPro");
		String id="";
		String pwd="";
		
		id = req.getParameter("id");
		pwd = req.getParameter("pwd");
		
		Map result = new HashMap();
		result.put("id", id);
		result.put("pwd", pwd);
		
		return result;
    }
}

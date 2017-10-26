package lee.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ch.qos.logback.core.net.SyslogOutputStream;
import lee.login.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@RequestMapping(value = "/login/loginPro", method = RequestMethod.POST)
    public  @ResponseBody Map<String, String> usrAddPro(HttpServletRequest req) {
		Map<String, String> params = new HashMap<String, String>();
		String id="";
		String pw="";
		int idCnt=0;
		String msg="";
		
		id = req.getParameter("id");
		pw = req.getParameter("pw");
		params.put("id", id);
		params.put("pw", pw);
		idCnt = loginService.checkId(id);
		if(idCnt!=0) {
			boolean result = loginService.checkPw(params);
			msg = result == true ? "success" : "Your password is incorrect.";
		}else {
			msg = "Id is not found.";
		}
		
		params.put("msg", msg);
		
		return params;
    }
}

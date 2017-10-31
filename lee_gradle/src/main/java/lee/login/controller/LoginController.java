package lee.login.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lee.comm.conf.LeeCode;
import lee.domain.UsrVO;
import lee.login.service.LoginService;

@Controller
public class LoginController {
	
	@Resource(name="loginservice")
	LoginService loginservice;
	
	@RequestMapping(value = "/login/login", method = RequestMethod.GET)
    public String login(Locale locale, Model model ) {
        return "login/login";
    }
	
	@RequestMapping(value = "/login/loginPro", method = RequestMethod.POST)
    public  @ResponseBody Map<String, String> loginPro(HttpServletRequest req) {
		Map<String, String> params = new HashMap<String, String>();
		String id="";
		String pw="";
		int idCnt=0;
		String msg="";
		boolean result = false;
		
		id = req.getParameter("id");
		pw = req.getParameter("pw");
		params.put("id", id);
		params.put("pw", pw);
		
		idCnt = loginservice.checkId(id);
		
		if(idCnt!=0) {
			result = loginservice.checkPw(params);
			msg = result == true ? "success" : "Your password is incorrect.";
		}else {
			msg = "Id is not found.";
		}
		
		if(result) {
			UsrVO usrSession = loginservice.getUsr(params);
			
			HttpSession session  = req.getSession(true);  
			session.setAttribute(LeeCode.usrSession, usrSession);  
		}
		
		params.put("msg", msg);
		params.put("result", result+"");
		
		return params;
    }
	@RequestMapping(value = "/login/logOutPro", method = RequestMethod.POST)
    public  @ResponseBody Map<String, String> logOutPro(HttpServletRequest req) {
		Map<String, String> params = new HashMap<String, String>();
		HttpSession session  = req.getSession(true);
		session.removeAttribute(LeeCode.usrSession);

		params.put("msg", "logout success");
		
		return params;
    }
	
}

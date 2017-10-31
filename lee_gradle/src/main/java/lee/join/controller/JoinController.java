package lee.join.controller;

import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lee.domain.UsrVO;
import lee.join.service.JoinService;

@Controller
public class JoinController {
	
	@Resource(name="joinservice")
	JoinService joinservice;

	@RequestMapping(value = "/join/usrAdd", method = RequestMethod.GET)
    public String usrAdd(Locale locale, Model model ) {
        return "join/usrAdd";
    }
	
	@RequestMapping(value = "/join/usrAddPro", method = RequestMethod.POST)
    public String usrAddPro(Locale locale, Model model, @ModelAttribute("usrVO") UsrVO usrVO) {
       long seq = joinservice.addUsr(usrVO);
        return "join/usrAddEnd";
    }
}

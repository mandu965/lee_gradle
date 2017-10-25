package lee.join.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lee.domain.UsrVO;
import lee.join.service.JoinService;
import lee.main.service.MainService;

@Controller
public class JoinController {
	
	@Autowired
	JoinService joinservice;

	@RequestMapping(value = "/join/usrAdd", method = RequestMethod.GET)
    public String usrAdd(Locale locale, Model model ) {
        System.out.println("usr Add Form");
        

        //UsrVO usrVO = mainService.getUsr() ;
        
        //model.addAttribute("usr", usrVO );
       
         
        return "join/usrAdd";
    }
	
	@RequestMapping(value = "/join/usrAddPro", method = RequestMethod.POST)
    public String usrAddPro(Locale locale, Model model, @ModelAttribute("usrVO") UsrVO usrVO) {
       System.out.println("usr AddPro");
       
       long seq = joinservice.addUsr(usrVO);
       System.out.println("end" + seq);

        return "join/usrAddEnd";
    }
}

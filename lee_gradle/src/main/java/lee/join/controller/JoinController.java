package lee.join.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lee.domain.UsrVO;

@Controller
public class JoinController {
	
	@RequestMapping(value = "/join/usrAdd", method = RequestMethod.GET)
    public String usrAdd(Locale locale, Model model ) {
        System.out.println("usr Add Form");
        

        //UsrVO usrVO = mainService.getUsr() ;
        
        //model.addAttribute("usr", usrVO );
       
         
        return "join/usrAdd";
    }
	
	@RequestMapping(value = "/join/usrAddPro")
    public String usrAddPro(Locale locale, Model model, @ModelAttribute("usrVO") UsrVO usrVO) {
        System.out.println("usr AddPro");
       
        //UsrVO usrVO = mainService.getUsr() ;
        
        //model.addAttribute("usr", usrVO );
   
        return "index";
    }
}

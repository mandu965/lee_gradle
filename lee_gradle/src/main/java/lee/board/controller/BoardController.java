package lee.board.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@RequestMapping(value = "/board/**/BoardList", method = RequestMethod.GET)
    public String usrAdd(Locale locale, Model model) {
        System.out.println("usr Add Form");
        

        //UsrVO usrVO = mainService.getUsr() ;
        
        //model.addAttribute("usr", usrVO );
       
         
        return "sm/usr/usrList";
    }
}

package lee.main.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lee.main.service.MainService;

@Controller
public class MainController {
	// http://dynaticy.tistory.com/category/Dev%20Story/Gradle 22
	// http://stag.tistory.com/22
	//private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	MainService mainService;
	
 	@RequestMapping(value = "/", method = RequestMethod.GET)
    public String main(Locale locale, Model model) {
        
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
         
        String formattedDate = dateFormat.format(date);
         
        model.addAttribute("serverTime", formattedDate );

        //UsrVO usrVO = mainService.getUsr() ;
        
        //model.addAttribute("usr", usrVO );
       
         
        return "index";
    }

}

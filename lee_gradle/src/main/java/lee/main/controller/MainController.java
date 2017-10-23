package lee.main.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lee.domain.UsrVO;
import lee.main.repository.MainRepository;

@Controller
public class MainController {
	//Âü°í http://dynaticy.tistory.com/category/Dev%20Story/Gradle 22
	// http://stag.tistory.com/22
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	MainRepository mainRepository;
	
 	@RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        logger.info("Welcome home! The client locale is {}.", locale);
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
         
        String formattedDate = dateFormat.format(date);
         
        model.addAttribute("serverTime", formattedDate );

        UsrVO userVO = mainRepository.getUsr() ;
        if(userVO!=null) {
        	logger.info("success");
        	logger.info(mainRepository.getUsr().getUsr_id() + "---" + mainRepository.getUsr().getUsr_nm());
        	System.out.println(mainRepository.getUsr().getUsr_id() + "---" + mainRepository.getUsr().getUsr_nm());
        }else {
        	logger.info("fail");
        }
        model.addAttribute("usr", mainRepository.getUsr() );
       
         
        return "index";
    }

}

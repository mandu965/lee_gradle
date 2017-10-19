package lee.main.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lee.domain.UserVO;
import lee.main.repository.MainRepository;

@Controller
public class MainController {
	//참고 http://dynaticy.tistory.com/category/Dev%20Story/Gradle 22
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
        logger.info("쿼리 시작" + mainRepository.getUser());
        UserVO userVO = mainRepository.getUser() ;
        if(userVO!=null) {
        	logger.info("success");
        }else {
        	logger.info("fail");
        }
        model.addAttribute("user", mainRepository.getUser() );
        //logger.info(mainRepository.getUser().getUser_id() + "---" + mainRepository.getUser().getUser_name());
         
        return "index";
    }

}

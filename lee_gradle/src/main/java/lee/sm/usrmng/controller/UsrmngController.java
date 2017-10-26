package lee.sm.usrmng.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UsrmngController {
	
	@RequestMapping(value = "/sm/usrmng/usrmngList", method = RequestMethod.GET)
    public String main(Locale locale, Model model) {
        

        return "/sm/usrmng/usrmngList";
    }
}

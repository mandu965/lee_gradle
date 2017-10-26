package lee.sm.usr.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UsrController {
	@RequestMapping(value = "/sm/usrList", method = RequestMethod.GET)
    public String usrAdd(Locale locale, Model model) {
        return "sm/usr/usrList";
    }
}

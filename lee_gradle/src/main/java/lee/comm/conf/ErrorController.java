package lee.comm.conf;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {

	@RequestMapping(value = "/error/adminCheck", method = RequestMethod.GET)
    public String usrAdd(Locale locale, Model model ) {
        return "error/adminCheck";
    }
}

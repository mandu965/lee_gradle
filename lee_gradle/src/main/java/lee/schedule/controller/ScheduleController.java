package lee.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {
	@RequestMapping(value = "/schedule/scheduleList")
    public String test(Model model) {
		
        return "schedule/schedule";
         
    }
}

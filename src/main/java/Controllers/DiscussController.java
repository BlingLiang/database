package Controllers;


import POJO.Discuss;
import com.mysql.cj.Session;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import Service.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/discuss")
public class DiscussController {

    DBService service ;

    @RequestMapping("/")
    @ResponseBody
    public String showMessage(String time, String newContext , String extendss, Model model, HttpSession session)
    {
        String courseId = (String)session.getAttribute("CourseId");
        String userId = (String)session.getAttribute("userId");
        Discuss discuss = new Discuss(courseId, time, newContext, userId,extendss);
        service.insertDis(discuss);
        return "插入成功";
    }

    @RequestMapping("/queryDiscuss")
    public ModelAndView getDiscusses(String courseId){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("showDiscuss");
        Discuss[] newDiscuss = service.showDiscuss(courseId);
        mav.addObject("discusses", newDiscuss);
        return mav;
    }
}

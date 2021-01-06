package Controllers;

import POJO.inform;
import Service.DBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/Inform")
public class informController {
    @Autowired
    DBService service;
    Date dd;

    @RequestMapping("/informs")
    public ModelAndView show_ALLInform(String studentId, HttpSession session){
        System.out.println("goto informs:"+studentId);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("stu_pages/information");
        List<inform> ResultSet=service.queryAllInform(studentId);;
        System.out.println("informs: "+ResultSet.toString());
        return mav;
    }

    @RequestMapping("/Course")
    public ModelAndView show_OneInform(HttpSession session){
        String courseID = (String)session.getAttribute("courseId");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tea_pages/informPage");
        List<inform> ResultSet=service.queryOneInform(courseID);
        mav.addObject("informs", ResultSet);
        return mav;
    }

    @ResponseBody
    @RequestMapping("/insert")
    public String insertInform(String context, HttpSession session){
        System.out.println("context: "+context);
        String courseId = (String) session.getAttribute("courseId");
        dd = new Date();
        inform inf = new inform(courseId, context, dd.toString());
        service.insertInform(inf);
        return "insert success";
    }
}

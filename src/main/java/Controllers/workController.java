package Controllers;

import POJO.Work;
import POJO.Work_details;
import Service.DBService;
import Service.WorkWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("/work")
public class workController {

    @Autowired
    WorkWriter workwriter;

    @Autowired
    DBService service;


    @RequestMapping("/insertWork")
    @ResponseBody
    public String insertWork(String workname, String[] selections, String[] judges, String[] subs,HttpSession session){
        System.out.println("Work here");
        String courseId =(String)session.getAttribute("courseId");
        Work_details work_d = new Work_details(workname,selections,judges,subs);
        String filepath = "D:/"+workname+".txt";
        workwriter.writeWork(filepath,work_d);
        Work work = new Work(courseId,workname,filepath);
        service.insertWork(work);
        return "success";
    }

    @RequestMapping("/insertExam")
    @ResponseBody
    public String insertExam(String workname, String[] selections, String[] judges, String[] subs,HttpSession session){
        System.out.println("Exam here");
        String courseId =(String)session.getAttribute("courseId");
        Work_details work_d = new Work_details(workname,selections,judges,subs);
        String filepath = "D:/"+workname+".txt";
        workwriter.writeWork(filepath,work_d);
        Work work = new Work(courseId,workname,filepath);
        service.insertExam(work);
        return "success";

    }
}

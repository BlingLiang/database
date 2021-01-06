package Controllers;

import POJO.*;
import Service.DBService;
import Service.WorkWriter;
import com.mysql.cj.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.lang.reflect.Array;
import java.net.http.HttpResponse;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/page")
public class PageController {
    @Autowired
    DBService service;

    @Autowired
    WorkWriter writer;
    @RequestMapping("/turn")
    public ModelAndView turnToPages(String target, HttpSession session){
        ModelAndView mov = new ModelAndView();
        String type= (String)session.getAttribute("type");
        mov.setViewName(target);
        System.out.println("redirect to: "+target);
        return mov;
    }

    @RequestMapping("/course")
    public ModelAndView toCoursePage(String courseId, HttpSession session){
        String type = (String)session.getAttribute("type");
        ModelAndView mav = new ModelAndView();
        if(type.equals("teacher")) {
            mav.setViewName("tea_pages/coursePage");
        }else{
            mav.setViewName("stu_pages/coursePage");
        }
        System.out.println("CourseID "+courseId);
        session.setAttribute("courseId", courseId);
        return mav;
    }


    @RequestMapping("/cinforms")
    public ModelAndView show_OneInform(HttpSession session){
        String courseID = (String)session.getAttribute("courseId");
        System.out.println("informCours:"+courseID);
        String type = (String)session.getAttribute("type");
        ModelAndView mav = new ModelAndView();
        if(type.equals("teacher")) {
            mav.setViewName("tea_pages/informPage");
        }else{
            mav.setViewName("stu_pages/information");
        }
        List<inform> ResultSet=service.queryOneInform(courseID);
        System.out.println("result: "+ResultSet.toString());
        mav.addObject("informs", ResultSet);
        return mav;
    }

    @RequestMapping("/informs")
    public ModelAndView show_ALLInform( HttpSession session){
        String type = (String)session.getAttribute("type");
        String studentId = ((User)session.getAttribute("user")).getNumber();
        System.out.println("goto informs:"+studentId);
        ModelAndView mav = new ModelAndView();
        if(type.equals("teacher")) {
            mav.setViewName("tea_pages/information_total");
        }else{
            mav.setViewName("stu_pages/information_total");
        }
        List<inform> ResultSet=service.queryAllInform(studentId);;
        System.out.println("informs: "+ResultSet.toString());
        return mav;
    }

    @RequestMapping("/homework")
    public ModelAndView toHomeWork(HttpSession session){
        String type = (String)session.getAttribute("type");
        ModelAndView mav = new ModelAndView();
        if(type.equals("teacher")) {
            mav.setViewName("tea_pages/homework");
        }else{
            mav.setViewName("stu_pages/homework");
        }
        String courseId = (String)session.getAttribute("courseId");
        System.out.println("CourseId"+courseId);
        List<Work> ResultSet =service.queryWorkById(courseId);
        session.setAttribute("works", ResultSet);
        System.out.println("homeworks: "+ResultSet.toString());
        return mav;
    }

    @RequestMapping("/exam")
    public ModelAndView toExam(HttpSession session){
        String type = (String)session.getAttribute("type");
        ModelAndView mav = new ModelAndView();
        if(type.equals("teacher")) {
            mav.setViewName("tea_pages/exam");
        }else{
            mav.setViewName("stu_pages/test");
        }
        String courseId = (String)session.getAttribute("courseId");
        System.out.println("CourseId"+courseId);
        List<Work> ResultSet =service.queryExamById(courseId);
        session.setAttribute("exams", ResultSet);
        System.out.println("exams: "+ResultSet.toString());
        return mav;
    }

    @RequestMapping("/material")
    public ModelAndView toMaterial(HttpSession session){
        String type = (String)session.getAttribute("type");
        ModelAndView mav = new ModelAndView();
        if(type.equals("student")){
            mav.setViewName("stu_pages/material");
        }else{
            mav.setViewName("tea_pages/material");
        }
        return mav;
    }

    @RequestMapping("/doWork")
    public ModelAndView toWorkPage(String workId, HttpSession session){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("stu_pages/doWork");
        String path = "D:/"+workId+".txt";
        Work_details details = null;
        try{
            System.out.println(path);
            FileInputStream inputStream = new FileInputStream(path);
            ObjectInputStream stream = new ObjectInputStream(inputStream);
            details = (Work_details) stream.readObject();
            stream.close();
            inputStream.close();
        }catch (Exception e){
            System.out.println(e.getStackTrace());
            System.out.println(e.getCause());
            System.out.println(e.getMessage());
        }

        mav.addObject("workid",workId);
        mav.addObject("selects",details.selects.toString());
        mav.addObject("judges",details.judges.toString());
        mav.addObject("subs",details.subs.toString());
        return mav;
    }
    @RequestMapping("postHomeWork")
    @ResponseBody
    public String postWork(String[] selA,String[] judA, String[] subA, String workName, HttpSession session){
        String courseId = (String)session.getAttribute("courseId");
        String studentId = ((User)session.getAttribute("user")).getNumber();
        String path = "D:/"+workName+".txt";
        Work_details details = null;
        try{
            System.out.println("1");
            System.out.println(path);
            FileInputStream inputStream = new FileInputStream(path);
            System.out.println("2");
            ObjectInputStream stream = new ObjectInputStream(inputStream);
            System.out.println("3");
            details = (Work_details) stream.readObject();
            System.out.println("4");
            stream.close();
            inputStream.close();
        }catch (Exception e){
            System.out.println(e.getStackTrace());
            System.out.println(e.getCause());
            System.out.println(e.getMessage());
        }
        Work_details newDetail = new Work_details();
        newDetail.selects = details.selects;
        newDetail.judges = details.judges;
        newDetail.subs = details.subs;
        System.out.println(selA.length);
        newDetail.setAllAnswer(selA, judA, subA);
        newDetail.getScore(details);
        int score = newDetail.getTotalScore();
        String wpath = "D:/work_"+workName+"_"+studentId+".txt";
        service.postWork(studentId,courseId,workName,wpath,score);
        writer.writeWork(wpath,newDetail);
        return "success";
    }

    @RequestMapping("homeworkAnalysis")
    public ModelAndView xxx(String workId,HttpSession session){
        session.setAttribute("workId", workId);
        String courseId = (String)session.getAttribute("courseId");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tea_pages/perHomeworkAnalysis");
        Student students[] = service.queryStuByCourseID(courseId);
        int size = students.length;
        String names[] = new String[size];
        String ids[] = new String[size];
        int scores[] = new int[size];
        WorkRecord records[] = service.queryWorkByName(courseId,workId);
        String info[] = new String[size];
        for(int i = 0; i<size; i++){
            names[i] = students[i].getName();
            ids[i] = students[i].getNumber();
            scores[i] = -1;
            info[i] = "未提交";
            System.out.println("length: "+records.length);
            for(WorkRecord record:records){
                if(record.getStuId().equals(ids[i])){
                    scores[i] = record.getScore();
                    info[i] = "详情";
                }
            }

        }

        mav.addObject("names", Arrays.toString(names));
        mav.addObject("ids",Arrays.toString(ids));
        mav.addObject("scores",Arrays.toString(scores));
        mav.addObject("info",Arrays.toString(info));
        System.out.println(Arrays.toString(info));
        return mav;

    }

    @RequestMapping("OnehomeworkAnalysis")
    public ModelAndView yyy(String stuId,HttpSession session){
        session.setAttribute("stuId",stuId);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tea_pages/perWorkInfo");
        String workName = (String)session.getAttribute("workId");
        String courseId = (String)session.getAttribute("courseId");
        WorkRecord records[] = service.queryWorkByName(courseId,workName);
        String path = null;
        Work_details details = null;
        for(WorkRecord record : records){
            if(record.getStuId().equals(stuId)){
                path = record.getWorkRef();
            }
        }
        try{
            System.out.println(path);
            FileInputStream inputStream = new FileInputStream(path);
            ObjectInputStream stream = new ObjectInputStream(inputStream);
            details = (Work_details) stream.readObject();
            stream.close();
            inputStream.close();

        }catch (Exception e){
            System.out.println(e.getStackTrace());
            System.out.println(e.getCause());
            System.out.println(e.getMessage());
        }
        String selA[] = details.getSelA();
        String judA[] = details.getJudA();
        String subA[] = details.getSubA();
        mav.addObject("selA", Arrays.toString(selA));
        mav.addObject("judA", Arrays.toString(judA));
        mav.addObject("subA", Arrays.toString(subA));
        mav.addObject("details", details.toString());
        return mav;
    }

    @RequestMapping("/updateScore")
    @ResponseBody
    public String zzz(String scores[], HttpSession session){
        int subscore = 0;
        String workName = (String)session.getAttribute("workId");
        String courseId = (String)session.getAttribute("courseId");
        String StuId = (String)session.getAttribute("stuId");
        for(String s:scores){
            subscore += Integer.parseInt(s);
        }
        WorkRecord[] records = service.queryWorkByName(courseId,workName);
        int oriscore = 0;
        for(WorkRecord record : records){
            if(record.getStuId().equals(StuId)){
                oriscore = record.getScore();
            }
        }
        service.updateWorkByName(courseId,workName,StuId,oriscore+subscore);
        return "success";
    }

    @RequestMapping("/doExam")
    public ModelAndView toExamPage(String workId, HttpSession session){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("stu_pages/doExam");
        String path = "D:/"+workId+".txt";
        Work_details details = null;
        try{
            System.out.println(path);
            FileInputStream inputStream = new FileInputStream(path);
            ObjectInputStream stream = new ObjectInputStream(inputStream);
            details = (Work_details) stream.readObject();
            stream.close();
            inputStream.close();
        }catch (Exception e){
            System.out.println(e.getStackTrace());
            System.out.println(e.getCause());
            System.out.println(e.getMessage());
        }

        mav.addObject("workid",workId);
        mav.addObject("selects",details.selects.toString());
        mav.addObject("judges",details.judges.toString());
        mav.addObject("subs",details.subs.toString());
        return mav;
    }
    @RequestMapping("postExam")
    @ResponseBody
    public String postExam(String[] selA,String[] judA, String[] subA, String workName, HttpSession session){
        String courseId = (String)session.getAttribute("courseId");
        String studentId = ((User)session.getAttribute("user")).getNumber();
        String path = "D:/"+workName+".txt";
        Work_details details = null;
        try{
            System.out.println(path);
            FileInputStream inputStream = new FileInputStream(path);
            ObjectInputStream stream = new ObjectInputStream(inputStream);
            details = (Work_details) stream.readObject();
            stream.close();
            inputStream.close();
        }catch (Exception e){
            System.out.println(e.getStackTrace());
            System.out.println(e.getCause());
            System.out.println(e.getMessage());
        }
        Work_details newDetail = new Work_details();
        newDetail.selects = details.selects;
        newDetail.judges = details.judges;
        newDetail.subs = details.subs;
        System.out.println(selA.length);
        newDetail.setAllAnswer(selA, judA, subA);
        newDetail.getScore(details);
        int score = newDetail.getTotalScore();
        String wpath = "D:/work_"+workName+"_"+studentId+".txt";
        service.postExam(studentId,courseId,workName,wpath,score);
        writer.writeWork(wpath,newDetail);
        return "success";
    }
    @RequestMapping("examAnalysis")
    public ModelAndView xxxE(String workId,HttpSession session) {
        session.setAttribute("workId", workId);
        String courseId = (String) session.getAttribute("courseId");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tea_pages/perExamAnalysis");
        Student students[] = service.queryStuByCourseID(courseId);
        int size = students.length;
        String names[] = new String[size];
        String ids[] = new String[size];
        int scores[] = new int[size];
        System.out.println(courseId);
        System.out.println(workId);
        WorkRecord records[] = service.queryExamByName(courseId, workId);
        System.out.println(Arrays.toString(records));
        String info[] = new String[size];
        for (int i = 0; i < size; i++) {
            names[i] = students[i].getName();
            ids[i] = students[i].getNumber();
            scores[i] = -1;
            info[i] = "未提交";
            System.out.println("length: " + records.length);
            for (WorkRecord record : records) {
                if (record.getStuId().equals(ids[i])) {
                    scores[i] = record.getScore();
                    info[i] = "详情";
                }
            }

        }
        mav.addObject("names", Arrays.toString(names));
        mav.addObject("ids",Arrays.toString(ids));
        mav.addObject("scores",Arrays.toString(scores));
        mav.addObject("info",Arrays.toString(info));
        System.out.println(Arrays.toString(info));
        return mav;
    }
    @RequestMapping("OneexamAnalysis")
    public ModelAndView yyye(String stuId,HttpSession session){
        session.setAttribute("stuId",stuId);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("tea_pages/perExamInfo");
        String workName = (String)session.getAttribute("workId");
        String courseId = (String)session.getAttribute("courseId");
        WorkRecord records[] = service.queryExamByName(courseId,workName);
        System.out.println(records);
        String path = null;
        Work_details details = null;
        for(WorkRecord record : records){
            if(record.getStuId().equals(stuId)){
                path = record.getWorkRef();
            }
        }
        try{
            System.out.println(path);
            FileInputStream inputStream = new FileInputStream(path);
            ObjectInputStream stream = new ObjectInputStream(inputStream);
            details = (Work_details) stream.readObject();
            stream.close();
            inputStream.close();

        }catch (Exception e){
            System.out.println(e.getStackTrace());
            System.out.println(e.getCause());
            System.out.println(e.getMessage());
        }
        String selA[] = details.getSelA();
        String judA[] = details.getJudA();
        String subA[] = details.getSubA();
        mav.addObject("selA", Arrays.toString(selA));
        mav.addObject("judA", Arrays.toString(judA));
        mav.addObject("subA", Arrays.toString(subA));
        mav.addObject("details", details.toString());

        return mav;
    }
    @RequestMapping("/updateExamScore")
    @ResponseBody
    public String zzzE(String scores[], HttpSession session){
        int subscore = 0;
        String workName = (String)session.getAttribute("workId");
        String courseId = (String)session.getAttribute("courseId");
        String StuId = (String)session.getAttribute("stuId");
        for(String s:scores){
            subscore += Integer.parseInt(s);
        }
        WorkRecord[] records = service.queryExamByName(courseId,workName);
        int oriscore = 0;
        for(WorkRecord record : records){
            if(record.getStuId().equals(StuId)){
                oriscore = record.getScore();
            }
        }
        service.updateExamByName(courseId,workName,StuId,oriscore+subscore);
        return "success";
    }

}

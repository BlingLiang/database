package Controllers;

import POJO.Course;
import POJO.Student;
import POJO.User;
import Service.DBService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller()
@RequestMapping("/Class")
public class ClassController {
    @Autowired
    DBService service;

    @RequestMapping(value="/queryCourse",produces = "text/html;charset=UTF-8")
    public String queryClasses(String teacherId){
        List<Course> resultSet = service.queryCourses(teacherId);
        System.out.println(resultSet.toString());
        return resultSet.toString();
    }

    @RequestMapping("/createTable")
    @ResponseBody
    public String createTable(String CourseId){
        Student[] students = service.queryStuByCourseID(CourseId);
        service.creatable(CourseId);
        service.createCourseMSG(CourseId);
        service.createCourseExam(CourseId);
        service.createCourseWork(CourseId);
        InsertStudent(CourseId, students);
        Course course = service.queryCourse(CourseId);
        service.insertCourseOpened(course);
        return "createTable Success";
    }

    public void InsertStudent(String courseID, Student[] students){
        for(Student student: students){
            System.out.println(student);
            service.insertStudent(courseID, student);
        }
    }
}

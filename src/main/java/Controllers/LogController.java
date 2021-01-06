package Controllers;

import POJO.Course;
import POJO.User;
import POJO.inform;
import Service.DBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller()
@RequestMapping("/Log")
public class LogController {
    @Autowired
    DBService dbService;
    User user;

    @RequestMapping("/validate")
    @ResponseBody
    public String doValidate(String id, String password, String type, HttpSession session){
        String db_password;
        if(type.equals("student")){
            try{
                user = dbService.queryStudent(id);
                db_password = user.getPassword();
            }catch (NullPointerException e){
                return "id not exists";
            }

        }else{
            try {
                user = dbService.queryTeacher(id);
                db_password = user.getPassword();
            }catch (NullPointerException e){
                return "id not exists";
            }
        }

        if(db_password.equals(password)){
            session.setAttribute("user", user);
            session.setAttribute("type",type);
            List<Course> courses = dbService.ShowCourse(id, type);
            session.setAttribute("courses",courses);
            if(type.equals("student")){
                List<inform> informs = dbService.queryAllInform(id);
                System.out.println(informs.toString());
                session.setAttribute("informs", informs);
            }
            //若密码正确，返回”log success“,若密码错误，返回"log failed"
            return "log as "+type   ;
        }else{
            return "log failed";
        }

    }

    @ResponseBody
    @RequestMapping("/register")
    public String doRegister(String id, String password, String type, HttpSession session){
        System.out.println("id: "+id+" password: "+password+" type:"+type);
        if(type.equals("student")){
            if(dbService.queryStudent(id)!=null){
                dbService.updateStudent(id, "password", password);
                session.setAttribute("user",dbService.queryStudent(id));
                return "register success as student";
            }
            return "register failed as student";
        }else{
            if(dbService.queryTeacher(id)!=null){
                System.out.println(dbService.queryTeacher(id));
                dbService.updateTeacher(id, "password",  password);
                session.setAttribute("user",dbService.queryTeacher(id));
                return "register success as teacher";
            }
            return "register failed as teacher";
        }
    }

}

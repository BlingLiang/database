package Controllers;

import POJO.User;
import Service.DBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/persionInfo")
public class PersonInfoController {
    @Autowired
    DBService service;

    @RequestMapping("/update")
    @ResponseBody
    public String updateMSG(String age, String optionsRadiosinline, String beizhu, HttpSession session){
        User user = (User) session.getAttribute("user");
        String userID = user.getNumber();
        String type = (String) session.getAttribute("type");
        System.out.println("age: "+age+" sex: "+optionsRadiosinline+" beizhu:"+beizhu);
        if(type.equals("student")){
            if(user.getAge() != Integer.parseInt(age)){
                service.updateStudent(userID, "age", age);
            }
            if(!user.getSex().equals(optionsRadiosinline)){
                service.updateStudent(userID, "sex", optionsRadiosinline);
            }
            if(!user.getImply().equals(beizhu)){
                service.updateStudent(userID, "imply", beizhu);
            }
        }else{

            if(user.getAge() != Integer.parseInt(age)){
                service.updateTeacher(userID, "age", age);
            }
            if(user.getSex()==null || !user.getSex().equals(optionsRadiosinline)){
                service.updateTeacher(userID, "sex", optionsRadiosinline);
            }
            if(user.getImply()==null ||!user.getImply().equals(beizhu)){
                service.updateTeacher(userID, "imply", beizhu);
            }
        }
        return "update success";
    }

    @RequestMapping("/updatePSW")
    @ResponseBody
    public String renewPSW(String oldPassword, String newPassword, HttpSession session){
        System.out.println("oldPassword: "+oldPassword+" newPassword"+newPassword);
        User user = (User) session.getAttribute("user");
        String userID = user.getNumber();
        String type = (String) session.getAttribute("type");
        String oldpsw = user.getPassword();
        if(!oldPassword.equals(oldpsw)){
            return "原密码错误";
        }
        else{
            if(type.equals("student")){
                service.updateStudent(userID, "password", newPassword);
            }else{
                service.updateTeacher(userID, "password", newPassword);
            }
        }
        return "update success";
    }

}

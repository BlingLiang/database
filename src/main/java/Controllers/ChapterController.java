package Controllers;

import POJO.Chapter;
import Service.DBService;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller()
@RequestMapping("/inclass")
public class ChapterController {

    @Autowired
    DBService dbService;

    @RequestMapping("/editMSG")
    public void editCourseMSG(String courseId,String title, String level, String type){

    }
}

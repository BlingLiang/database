package DAO;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import POJO.*;

@Mapper
@Component
public interface DiscussDao {
    @Select("select * from discussCourse where courseID = #{courseId}")
    public Discuss[] ShowDiscuss(String courseId);

    @Update("insert into discussCourse values (#{1} , #{CourseID} , #{time} , #{context} , #{userID} , #{extendss})")
    public void InsertDiscuss(Discuss discuss);
}

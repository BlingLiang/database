package DAO;

import POJO.Course;
import POJO.teacher;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;


@Mapper
@Component
public interface teacherDao {

    @Select("select * from teacher where Number = #{id}")
    public teacher getById(String id);


    @Update("update teacher set ${targetProperty} = #{targetValue} where Number= #{teacherId}")
    public void updateMSG(@Param("teacherId") String teacherId, @Param("targetProperty") String targetProperty, @Param("targetValue") String targetValue);

    @Update("create table if not exists Course_${courseId} (stuId char(20), stuName char(20));")
    public void CreateTable(String CourseId);

    @Select("select * from course_opened where teacherID = #{teacherId}")
    public Course[] ShowCourse(String teacherId);
}

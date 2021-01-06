package DAO;

import POJO.Course;
import POJO.Student;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface studentDao {

    @Select("select * from student where Number= #{id}")
    public Student getById(String id);

    @Update("update student set ${targetProperty} = #{targetValue} where Number= #{studentId}")
    public void updateMSG(@Param("studentId") String studentId, @Param("targetProperty") String targetProperty, @Param("targetValue") String targetValue);

    @Select("select * from course_opened where courseID in (select courseID from sc where studentID= #{studentId})")
    public Course[] ShowCourse(String studentId);

}

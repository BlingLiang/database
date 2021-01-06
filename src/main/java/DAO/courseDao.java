package DAO;

import POJO.Course;
import POJO.Student;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface courseDao {

    @Insert("Insert into course values(#{serinum}, #{CourseSerinumber}, #{CourseName}, #{TeacherSerinum}, #{TeachingTime})")
    public void insertCourse(Course course);

    //查询课程
    @Select("Select * from course where courseID  = #{courseID}")
    public Course queryCourse(String courseID);

    @Update("Update course set #{targetProperty} = #{targetValue} where courseID = #{courseID}")
    public void updateCourse(String courseID, String targetProperty, String targetValue);

    @Select("select * from course where teacherID = #{TeaNumber}")
    public Course[] SearchCourse(String TeaNumber);

    @Select("select * from student where number in (select studentID from sc where courseID=#{CourseID})")
    public Student[] getStudentWithCourseId(String CourseID);


    @Insert("insert into Course_${courseId} values (#{Number} , #{Name})")
    public void insertStudent(@Param("courseId") String courseId, @Param("Number") String Number, @Param("Name") String Name);

    @Insert("Insert into course_opened values(#{serinum}, #{courseID}, #{courseName}, #{teacherID}, #{time})")
    public void insertCourseOpened(Course course);

    @Update("create table if not exists CourMSG_${CourseId} (level char(20), title char(20), context char(50))")
    public void createCourseMSG(String CourseId);

    @Update("create table if not exists Work_${CourseId} (stuId char(20), WorkName char(20), WorkRef char(50), score int)")
    public void createWorkMSG(String CourseId);

    @Update("create table if not exists Exam_${CourseId} (stuId char(20), WorkName char(20), WorkRef char(50), score int)")
    public void createExamMSG(String CourseId);

    @Insert("insert into Work_${CourseId} values(#{studentId},#{workName},#{workRef},#{score})")
    public void PostWorkMSG(@Param("CourseId") String CourseId, @Param("studentId") String studentId, @Param("workName") String workName, @Param("workRef") String workRef, @Param("score") int score);

    @Insert("insert into Exam_${CourseId} values(#{studentId},#{workName},#{workRef},#{score})")
    public void PostExamMSG(@Param("CourseId") String CourseId, @Param("studentId") String studentId, @Param("workName") String workName, @Param("workRef") String workRef, @Param("score") int score);

}

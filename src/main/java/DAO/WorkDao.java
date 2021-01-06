package DAO;

import POJO.Work;
import POJO.WorkRecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface WorkDao {

    @Update("insert into all_homework values(#{courseId}, #{workId}, #{workRef})")
    public void insertWork(Work work);

    @Update("insert into all_exam values(#{courseId}, #{workId}, #{workRef})")
    public void insertExam(Work work);

    @Select("select * from all_homework where courseId = #{courseId}")
    public Work[] queryWorkByCourseId(String courseId);

    @Select("select * from all_exam where courseId = #{courseId}")
    public Work[] queryExamByCourseId(String courseId);

    @Select("select * from Work_${courseId} where WorkName = #{workname}")
    public WorkRecord[] queryWorkByName(@Param("courseId") String courseId, @Param("workname") String workname);

    @Select("select * from Exam_${courseId} where WorkName = #{workname}")
    public WorkRecord[] queryExamByName(@Param("courseId") String courseId, @Param("workname") String workname);

    @Select("update Work_${courseId} set score = #{score} where WorkName = #{workname} and stuId=#{studentId}")
    public void UpdateWorkByName(@Param("courseId") String courseId, @Param("workname") String workname, @Param("studentId") String studentId, @Param("score") int score);

    @Select("update Exam_${courseId} set score = #{score} where WorkName = #{workname} and stuId=#{studentId}")
    public void UpdateExamByName(@Param("courseId") String courseId, @Param("workname") String workname, @Param("studentId") String studentId, @Param("score") int score);

}

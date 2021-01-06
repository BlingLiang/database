package DAO;

import POJO.Chapter;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface chapterDao {

    @Insert("insert into CourMSG_${CourseId} values(#{level}, #{title}, #{context})")
    public void insertCourseMSG(@Param("CourseId") String CourseId, @Param("level") String level, @Param("title") String title,@Param("context") String context);

    @Update("update CourMSG_${courseID} set ${targetProperty} = #{targetValue}")
    public void updateCourseMSG(@Param("courseID") String courseID, @Param("targetProperty") String targetProperty, @Param("targetValue") String targetValue);

    @Select("select * from CourMSG_${CourseId}")
    public Chapter[] queryChapters(String courseId);
}

package DAO;

import POJO.inform;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface informDao {
    @Insert("insert into inform values(#{courseID},#{context},#{releaseTime})")
    public void Insert_intoInformTable(inform inf);

    @Select("select * from inform where courseID=#{courseID}")
    public inform[] select_oneinform(String courseID);

    @Select("select * from inform where courseID in(select courseID from sc where studentID=#{studentID})")
    public inform[] select_ALLinform(String studentID);

    @Update("update inform set ${targetProperty} = ${targetValue} where informID = #{informID}")
    public void updateInform(@Param("targetProperty") String targetProperty, @Param("targetValue") String targetValue, @Param("informID") String informID);
}

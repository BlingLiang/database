package Service;

import DAO.*;
import POJO.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.ArrayList;
import java.util.List;

@org.springframework.stereotype.Service
public class DBService {
    @Autowired
    courseDao c_impl;

    @Autowired
    studentDao s_impl;

    @Autowired
    teacherDao t_impl;

    @Autowired
    chapterDao ch_impl;

    @Autowired
    DiscussDao dis_impl;

    @Autowired
    informDao in_impl;

    @Autowired
    WorkDao w_impl;

    public void insertCourse(Course course){
        c_impl.insertCourse(course);
    }
    public Course queryCourse(String courseID){
        return c_impl.queryCourse(courseID);
    }
    public void updateCourse(String courseID,String targetProperty, String targetValue){
        c_impl.updateCourse(courseID, targetProperty, targetValue);
    }


    public Student queryStudent(String studentID){
        return s_impl.getById(studentID);
    }

    public void updateStudent(String studentID, String targetProperty, String targetValue){
        s_impl.updateMSG(studentID, targetProperty, targetValue);
    }
    public teacher queryTeacher(String teacherID){
        teacher t = t_impl.getById(teacherID);
        if(t!=null){
            return t;
        }else{
            return null;
        }
    }
    public void updateTeacher(String teacherID, String targetProperty, String targetValue){
        System.out.println("t_impl: "+teacherID+" :"+targetProperty+" :"+targetValue);
        t_impl.updateMSG(teacherID, targetProperty, targetValue);
    }



    public List<Course> queryCourses(String teacherID){
        List<Course> result = new ArrayList<>();
        System.out.println(teacherID);
        Course[] resultSet = c_impl.SearchCourse(teacherID);
        for(Course c:resultSet){
            result.add(c);
        }
        System.out.println(result.toString());
        return result;
    }

    public Student[] queryStuByCourseID(String courseID){
        Student[] stus = c_impl.getStudentWithCourseId(courseID);
        System.out.println(stus);
        return stus;
    }

    public void insertStudent(String courseID, Student student){
        c_impl.insertStudent(courseID, student.getNumber(), student.getName());
    }

    public void creatable(String courseID){
        System.out.println("Create: "+courseID);
        t_impl.CreateTable(courseID);
    }

    public void insertCourseOpened(Course course){
        c_impl.insertCourseOpened(course);
    }

    public void createCourseMSG(String courseId){
        c_impl.createCourseMSG(courseId);
    }

    public void createCourseWork(String courseId){
        c_impl.createWorkMSG(courseId);

    }
    public void createCourseExam(String courseId){
        c_impl.createExamMSG(courseId);

    }
    public List<Course> ShowCourse(String id, String type){
        List<Course> resultSet= new ArrayList<>();
        Course courses[];
        if(type.equals("student")){
             courses = s_impl.ShowCourse(id);
        }else{
             courses = t_impl.ShowCourse(id);
        }
        for(Course c:courses){
            resultSet.add(c);
        }
        return resultSet;
    }
    public void addChapter(String courseId, String level, String title, String context){
        ch_impl.insertCourseMSG(courseId, level, title, context);
    }

    public void updateChapter(String courseId, String targetProperty, String targetValue){
        ch_impl.updateCourseMSG(courseId, targetProperty, targetValue);
    }

    public List<Chapter> queryChapterById(String courseId){
        List<Chapter> resultSet = new ArrayList<>();
        Chapter[] chapters = ch_impl.queryChapters(courseId);
        for(Chapter c : chapters){
            resultSet.add(c);
        }
        return resultSet;
    }
    public void insertDis(Discuss discuss){
        dis_impl.InsertDiscuss(discuss);
    }

    public Discuss[] showDiscuss(String courseId){
        return dis_impl.ShowDiscuss(courseId);
    }

    public List<inform> queryAllInform(String studentId){
        List<inform>  aa=new ArrayList<>();
        inform[] ResultSet=in_impl.select_ALLinform(studentId);
        for(inform ss:ResultSet){
            aa.add(ss);
        }
        return aa;
    }
    public List<inform> queryOneInform(String courseID){
        List<inform> bb=new ArrayList<>();
        inform[] ResultSet=in_impl.select_oneinform(courseID);
        for(inform ss:ResultSet){
            bb.add(ss);
        }
        return bb;
    }
    public void insertInform(inform inf){
        in_impl.Insert_intoInformTable(inf);
    }
    public void updateInform(String tar, String val, String informID){
        in_impl.updateInform(tar, val, informID);
    }

    public void insertWork(Work work){
        w_impl.insertWork(work);
    }
    public void insertExam(Work work){
        w_impl.insertExam(work);
    }
    public List<Work> queryWorkById(String courseId){
        List<Work> works = new ArrayList<>();
        Work[] ws = w_impl.queryWorkByCourseId(courseId);
        for(Work w : ws){
            works.add(w);
        }
        return works;
    }

    public List<Work> queryExamById(String courseId){
        List<Work> works = new ArrayList<>();
        Work[] ws = w_impl.queryExamByCourseId(courseId);
        for(Work w : ws){
            works.add(w);
        }
        return works;
    }

    public void postWork(String studentId, String courseId, String workname, String workRef, int score){
        c_impl.PostWorkMSG(courseId,studentId,workname,workRef,score);
    }
    public void postExam(String studentId, String courseId, String workname, String workRef, int score){
        c_impl.PostExamMSG(courseId,studentId,workname,workRef,score);
    }

    public WorkRecord[] queryWorkByName(String courseId, String workname){
        return w_impl.queryWorkByName(courseId, workname);
    }

    public WorkRecord[] queryExamByName(String courseId, String workname){
        return w_impl.queryExamByName(courseId, workname);
    }

    public void updateWorkByName(String courseId, String workname, String studentId, int score){
        w_impl.UpdateWorkByName(courseId,workname,studentId,score);
    }
    public void updateExamByName(String courseId, String workname, String studentId, int score){
        w_impl.UpdateExamByName(courseId,workname,studentId,score);
    }
}

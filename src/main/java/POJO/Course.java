package POJO;

import org.springframework.beans.factory.annotation.Autowired;

public class Course {
    int serinum; //序号
    String courseID ; //课程标号
    String courseName; //课程名称
    String teacherID; //教课老师名称
    String time; //教学时间

    public Course() {
    }

    public Course(int serinum, String courseID, String courseName, String teacherID, String time) {
        this.serinum = serinum;
        this.courseID = courseID;
        this.courseName = courseName;
        this.teacherID = teacherID;
        this.time = time;
    }

    public int getSerinum() {
        return serinum;
    }

    public void setSerinum(int serinum) {
        this.serinum = serinum;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(String teacherID) {
        this.teacherID = teacherID;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Course{" +
                "serinum=" + serinum +
                ", courseID='" + courseID + '\'' +
                ", courseName='" + courseName + '\'' +
                ", teacherID='" + teacherID + '\'' +
                ", time='" + time + '\'' +
                '}';
    }
}

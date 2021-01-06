package POJO;

public class Discuss {
    String seriNum;
    String courseID;
    String time;
    String context ;
    String userID;
    String extendss ;

    public String getSeriNum() {
        return seriNum;
    }

    public void setSeriNum(String seriNum) {
        this.seriNum = seriNum;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getExtendss() {
        return extendss;
    }

    public void setExtendss(String extendss) {
        this.extendss = extendss;
    }

    public Discuss(String courseID, String time, String context, String userID, String extendss) {
        this.courseID = courseID;
        this.time = time;
        this.context = context;
        this.userID = userID;
        this.extendss = extendss;
    }
}

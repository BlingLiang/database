package POJO;

public class inform {
    String courseID,context,releaseTime;

    public String getCourseID() {
        return courseID;
    }

    public String getContext() {
        return context;
    }

    public String getReleaseTime() {
        return releaseTime;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public void setReleaseTime(String releaseTime) {
        this.releaseTime = releaseTime;
    }

    public inform(String courseID, String context, String releaseTime) {
        this.courseID = courseID;
        this.context = context;
        this.releaseTime = releaseTime;
    }

    @Override
    public String toString() {
        return "inform{" +
                "courseID='" + courseID + '\'' +
                ", context='" + context + '\'' +
                ", releaseTime='" + releaseTime + '\'' +
                '}';
    }
}

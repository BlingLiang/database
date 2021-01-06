package POJO;

public class Work {
    String courseId;
    String workId;
    String workRef;

    public Work() {
    }

    public Work(String courseId, String workId, String workRef) {
        this.courseId = courseId;
        this.workId = workId;
        this.workRef = workRef;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getWorkId() {
        return workId;
    }

    public void setWorkId(String workId) {
        this.workId = workId;
    }

    public String getWorkRef() {
        return workRef;
    }

    public void setWorkRef(String workRef) {
        this.workRef = workRef;
    }

    @Override
    public String toString() {
        return "Work{" +
                "courseId='" + courseId + '\'' +
                ", workId='" + workId + '\'' +
                ", workRef='" + workRef + '\'' +
                '}';
    }
}

package POJO;

public class WorkRecord {
    String stuId;
    String WorkName;
    String WorkRef;
    int score;

    @Override
    public String toString() {
        return "WorkRecord{" +
                "stuId='" + stuId + '\'' +
                ", WorkName='" + WorkName + '\'' +
                ", WorkRef='" + WorkRef + '\'' +
                ", score=" + score +
                '}';
    }

    public WorkRecord(String stuId, String workName, String workRef, int score) {
        this.stuId = stuId;
        WorkName = workName;
        WorkRef = workRef;
        this.score = score;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getWorkName() {
        return WorkName;
    }

    public void setWorkName(String workName) {
        WorkName = workName;
    }

    public String getWorkRef() {
        return WorkRef;
    }

    public void setWorkRef(String workRef) {
        WorkRef = workRef;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}

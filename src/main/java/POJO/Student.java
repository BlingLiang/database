package POJO;

public class Student extends User{

    String grade;

    public Student(){
        super();
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public Student(int serinum, String number, String name, String sex, int age, String password, String picUrl, String imply, String grade) {
        super(serinum, number, name, sex, age, password, picUrl, imply);
        this.setGrade(grade);
    }

    @Override
    public String toString() {
        return "Student{" +
                "grade='" + grade + '\'' +
                ", serinum=" + serinum +
                ", Number='" + Number + '\'' +
                ", Name='" + Name + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", password='" + password + '\'' +
                ", picUrl='" + picUrl + '\'' +
                ", imply='" + imply + '\'' +
                '}';
    }
}

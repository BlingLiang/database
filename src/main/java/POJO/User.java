package POJO;

public class User {
    int serinum; //序号
    String Number; //工号
    String Name; // 教师姓名
    String sex ; //性别
    int age ; //年龄
    String password; //密码
    String picUrl; //图像地址
    String imply; //补充信息

    public int getSerinum() {
        return serinum;
    }

    public void setSerinum(int serinum) {
        this.serinum = serinum;
    }

    public String getNumber() {
        return Number;
    }

    public void setNumber(String number) {
        Number = number;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public String getImply() {
        return imply;
    }

    public void setImply(String imply) {
        this.imply = imply;
    }

    public User() {

    }

    public User(int serinum, String number, String name, String sex, int age, String password, String picUrl, String imply) {
        this.serinum = serinum;
        Number = number;
        Name = name;
        this.sex = sex;
        this.age = age;
        this.password = password;
        this.picUrl = picUrl;
        this.imply = imply;
    }

    @Override
    public String toString() {
        return "User{" +
                "serinum=" + serinum +
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

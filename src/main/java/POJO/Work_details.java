package POJO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Work_details implements Serializable {
    public List<Question_select> selects = new ArrayList<>();
    public List<Question_judge> judges = new ArrayList<>();
    public List<Question_subjuective> subs = new ArrayList<>();
    String workName;

    public Work_details() {
    }

    public Work_details(String workname, String[] selections, String[] judges, String[] subs){
        workName = workname;
        for(String str:selections){
            String[] selMSG = str.split(",");
            Question_select select = new Question_select(selMSG[0],selMSG[1],selMSG[2],selMSG[3],selMSG[4],selMSG[5],Integer.parseInt(selMSG[6]));
            selects.add(select);
        }
        for(String str:judges){
            String[] judMSG = str.split(",");
            Question_judge judge = new Question_judge(judMSG[0],judMSG[1],Integer.parseInt(judMSG[2]));
            this.judges.add(judge);
        }
        for(String str:subs){
            String[] subMSG = str.split(",");
            Question_subjuective subjuective = new Question_subjuective(subMSG[0],subMSG[1],Integer.parseInt(subMSG[2]));
            this.subs.add(subjuective);
        }
    }

    public void getScore(Work_details standardWorkDetails){
        for(int i = 0; i<selects.size(); i++){
            System.out.println(this.selects.get(i).answer);
            System.out.println(standardWorkDetails.selects.get(i).answer);
            if(this.selects.get(i).answer.equals(standardWorkDetails.selects.get(i).answer)){
                System.out.println("T");
                this.selects.get(i).score = standardWorkDetails.selects.get(i).score;
            }else{
                this.selects.get(i).score = 0;
                System.out.println("F");
            }
        }
        for(int i = 0; i<judges.size(); i++){
            System.out.println(this.judges.get(i).answer);
            System.out.println(standardWorkDetails.judges.get(i).answer);
            if(this.judges.get(i).answer.equals(standardWorkDetails.judges.get(i).answer)){
                this.judges.get(i).score = standardWorkDetails.judges.get(i).score;
                System.out.println("T");
            }else{
                this.judges.get(i).score = 0;
                System.out.println("F");
            }
        }
        for(int i = 0; i<this.subs.size(); i++){
            this.subs.get(i).score = 0;
        }
    }

    public void setSubScore(int scores[]){
        for(int i = 0; i<this.subs.size(); i++){
            this.subs.get(i).score = scores[i];
        }
    }

    public int getTotalScore(){
        int totalScore = 0;
        for(Question_select q : this.selects){
            totalScore += q.score;
        }
        for(Question_judge q : this.judges){
            totalScore += q.score;
        }
        for(Question_subjuective q : this.subs){
            totalScore += q.score;
        }
        return totalScore;
    }
    class Question_select implements Serializable{
        String qContext;
        String selectItem[];
        int score;
        String answer;
        public Question_select(String qContext, String ItemA,String ItemB,String ItemC,String ItemD, String answer,int score) {
            this.score = score;
            this.answer = answer;
            this.qContext = qContext;
            this.selectItem = new String[4];
            selectItem[0] = ItemA;
            selectItem[1] = ItemB;
            selectItem[2] = ItemC;
            selectItem[3] = ItemD;
        }

        public void setAnswer(String answer) {
            this.answer = answer;
        }

        @Override
        public String toString() {
            return "Question_select{" +
                    "qContext='" + qContext + '\'' +
                    ", selectItem=" + Arrays.toString(selectItem) +
                    ", score=" + score +
                    ", answer='" + answer + '\'' +
                    '}';
        }
    }
    class Question_judge implements Serializable{
        int score;
        String answer;

        String qContext;

        public Question_judge(String qContext, String answer, int score) {
            this.score = score;
            this.answer = answer;
            this.qContext = qContext;
        }

        public void setAnswer(String answer) {
            this.answer = answer;
        }

        @Override
        public String toString() {
            return "Question_judge{" +
                    "score=" + score +
                    ", answer='" + answer + '\'' +
                    ", qContext='" + qContext + '\'' +
                    '}';
        }
    }
    class Question_subjuective implements Serializable{
        int score;
        String answer;
        String qContext;

        public void setAnswer(String answer) {
            this.answer = answer;
        }

        public Question_subjuective(String qContext, String answer, int score) {
            this.score = score;
            this.answer = answer;
            this.qContext = qContext;
        }

        @Override
        public String toString() {
            return "Question_subjuective{" +
                    "score=" + score +
                    ", answer='" + answer + '\'' +
                    ", qContext='" + qContext + '\'' +
                    '}';
        }
    }

    @Override
    public String toString() {
        return "Work_details{" +
                "selects=" + selects +
                ", judges=" + judges +
                ", subs=" + subs +
                ", workName='" + workName + '\'' +
                '}';
    }
    public void setAllAnswer(String[] selA,String[] judA, String[] subA){
        for(int i = 0;i<selA.length; i++){
            this.selects.get(i).setAnswer(selA[i]);
        }
        for(int i = 0;i<judA.length; i++){
            this.judges.get(i).setAnswer(judA[i]);
        }
        for(int i = 0;i<subA.length; i++){
            this.subs.get(i).setAnswer(subA[i]);
        }
    }

    public String[] getSelA(){
        int size = selects.size();
        String answer[] = new String[size];
        for(int i = 0; i<size; i++){
            answer[i] = selects.get(i).answer;
        }
        return answer;
    }
    public String[] getJudA(){
        int size = judges.size();
        String answer[] = new String[size];
        for(int i = 0; i<size; i++){
            answer[i] = judges.get(i).answer;
        }
        return answer;
    }
    public String[] getSubA(){
        int size = subs.size();
        String answer[] = new String[size];
        for(int i = 0; i<size; i++){
            answer[i] = subs.get(i).answer;
        }
        return answer;
    }
}

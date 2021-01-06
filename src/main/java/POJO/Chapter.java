package POJO;

import java.util.ArrayList;
import java.util.List;

public class Chapter {
    String title;
    String level;
    String context;

    public Chapter() {
    }

    public Chapter(String title, String level, String context) {
        this.title = title;
        this.level = level;
        this.context = context;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    @Override
    public String toString() {
        return "Chapter{" +
                "title='" + title + '\'' +
                ", level='" + level + '\'' +
                ", context='" + context + '\'' +
                '}';
    }
}

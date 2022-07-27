/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

/**
 *
 * @author Admin
 */
public class Lesson {
    private int lessonID;
    private String lessonName;
    private String video;
    private String content;
    private boolean status;
    private int position;
    private int watched;
    private Chapter chapter;

    public Lesson() {
    }
    
    public Lesson(int lessonID, String lessonName, String video, String content, boolean status, int position, Chapter chapter) {
        this.lessonID = lessonID;
        this.lessonName = lessonName;
        this.video = video;
        this.content = content;
        this.status = status;
        this.position = position;
        this.chapter = chapter;
    }

    public Lesson(int lessonID, String lessonName, String video, String content, boolean status, int position) {
        this.lessonID = lessonID;
        this.lessonName = lessonName;
        this.video = video;
        this.content = content;
        this.status = status;
        this.position = position;
    }
    
    public Lesson(int lessonID, String lessonName, String video, String content) {
        this.lessonID = lessonID;
        this.lessonName = lessonName;
        this.video = video;
        this.content = content;
    }

    public Lesson(int lessonID, String lessonName, int position) {
        this.lessonID = lessonID;
        this.lessonName = lessonName;
        this.position = position;
    }
    
    public Lesson(int lessonID, String lessonName, int position, int watched) {
        this.lessonID = lessonID;
        this.lessonName = lessonName;
        this.position = position;
        this.watched = watched;
    }

    public Chapter getChapter() {
        return chapter;
    }

    public void setChapter(Chapter chapter) {
        this.chapter = chapter;
    }
    
    
    public int getWatched() {
        return watched;
    }

    public void setWatched(int watched) {
        this.watched = watched;
    }
    
    public int getLessonID() {
        return lessonID;
    }

    public void setLessonID(int lessonID) {
        this.lessonID = lessonID;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }
}

package com.model.viewmodel;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;


public class SubmitTaskLinkVM {



    private long submitId;




    private int taskId;



    private String studentId;




    private String studentName;

    private List<String> link;
    private String task;

    private String submittedTime;

    public List<String> getLink() {
        return link;
    }

    public void setLink(List<String> link) {
        this.link = link;
    }

    public long getSubmitId() {
        return submitId;
    }

    public void setSubmitId(long submitId) {
        this.submitId = submitId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getTask() {
        return task;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public String getSubmittedTime() {
        return submittedTime;
    }

    public void setSubmittedTime(String submittedTime) {
        this.submittedTime = submittedTime;
    }

    public int getTaskId() {
        return taskId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    @Override
    public String toString() {
        return "SUBMIT_TASK{" +
                "submitId=" + submitId +
                "studentId=" + studentId +
                ", taskId='" + taskId + '\'' +
                ", task='" + task + '\'' +
                ", submittedTime='" + submittedTime +
                '}';
    }
}

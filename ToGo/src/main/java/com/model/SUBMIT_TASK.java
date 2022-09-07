package com.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "SUBMIT_TASKS")
public class SUBMIT_TASK {

    @Id
    @Column(name = "SUBMIT_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int submitId;


    @Column(name = "TASK_ID")

    private int taskId;

    @Column(name = "STUDENT_ID")

    private String studentId;


    @Column(name = "STUDENT_NAME")

    private String studentName;

    @Column(name = "TASK")

    private String task;

    @Column(name = "SUBMITTED_TIME")
    @NotNull
    private String submittedTime;

    public int getSubmitId() {
        return submitId;
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

    public void setSubmitId(int submitId) {
        this.submitId = submitId;
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

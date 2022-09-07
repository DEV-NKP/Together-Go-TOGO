package com.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "TASKS")
public class TASK {

    @Id
    @Column(name = "TASK_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int taskId;


    @Column(name = "ROOM_ID")
    @NotNull
    private String roomId;

    @Column(name = "TASK_TITLE")
    @NotNull
    private String taskTitle;

    @Column(name = "TASK_DETAILS")
    @NotNull
    private String taskDetails;

    @Column(name = "START_TIME")
    @NotNull
    private String startTime;

    @Column(name = "END_TIME")
    @NotNull
    private String endTime;
    @Column(name = "POST_TIME")
    @NotNull
    private String postTime;

    @Column(name = "STATUS")
    @NotNull
    private String status;

    public String getPostTime() {
        return postTime;
    }

    public void setPostTime(String postTime) {
        this.postTime = postTime;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getTaskTitle() {
        return taskTitle;
    }

    public void setTaskTitle(String taskTitle) {
        this.taskTitle = taskTitle;
    }

    public String getTaskDetails() {
        return taskDetails;
    }

    public void setTaskDetails(String taskDetails) {
        this.taskDetails = taskDetails;
    }

    @Override
    public String toString() {
        return "TASK{" +
                "submitId=" + taskId +
                "studentId=" + roomId +
                ", taskId='" + taskTitle + '\'' +
                ", task='" + taskDetails + '\'' +
                ", task='" + startTime + '\'' +
                ", task='" + endTime + '\'' +
                ", status='" + status  +
                '}';
    }
}

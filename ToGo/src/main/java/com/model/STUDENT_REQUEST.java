package com.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "STUDENT_REQUESTS")
public class STUDENT_REQUEST {

    @Id
    @Column(name = "REQUEST_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int reqId;


    @Column(name = "ROOM_ID")
    @NotNull
    private String roomId;

    @Column(name = "STUDENT_ID")
    @NotNull
    private String studentId;

    @Column(name = "REQUEST_TIME")
    @NotNull
    private String requestTime;


    public int getReqId() {
        return reqId;
    }

    public void setReqId(int reqId) {
        this.reqId = reqId;
    }

    public String getRequestTime() {
        return requestTime;
    }

    public String getRequestTime(@NotNull String intime) {
        return requestTime;
    }

    public void setRequestTime(String requestTime) {
        this.requestTime = requestTime;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    @Override
    public String toString() {
        return "STUDENT_REQUEST{" +
                "facultyId=" + reqId +
                ", studentId='" + studentId + '\'' +
                ", roomId='" + roomId + '\'' +
                ", requestTime='" + requestTime +

                '}';
    }
}

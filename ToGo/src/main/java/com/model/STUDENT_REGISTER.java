package com.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "STUDENT_REGISTERS")
public class STUDENT_REGISTER {

    @Id
    @Column(name = "REGISTRATION_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int regId;


    @Column(name = "ROOM_ID")
    @NotNull
    private String roomId;

    @Column(name = "STUDENT_ID")
    @NotNull
    private String studentId;


    public int getRegId() {
        return regId;
    }

    public void setRegId(int regId) {
        this.regId = regId;
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
        return "STUDENT_REGISTER{" +
                "facultyId=" + regId +
                ", picture='" + studentId + '\'' +
                ", firstName='" + roomId +

                '}';
    }
}

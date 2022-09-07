package com.model;


import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "CLASSROOMS")
public class CLASSROOM {


        @Id
        @Column(name = "ROOM_NO")
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int roomNo;

        @Column(name = "ROOM_ID")
        @NotNull
        private String roomId;

        @Column(name = "FACULTY_ID")
        @NotNull
        private String facultyId;

        @Column(name = "COURSE_NAME")
        @NotNull
        private String courseName;

        @Column(name = "COURSE_SECTION")
        @NotNull
        private String courseSection;

        @Column(name = "CREATE_TIME")
        @NotNull
        private String createTime;


        public int getRoomNo() {
            return roomNo;
        }

        public void setRoomNo(int roomNo) {
            this.roomNo = roomNo;
        }

        public String getRoomId() {
            return roomId;
        }

        public void setRoomId(String roomId) {
            this.roomId = roomId;
        }

        public String getFacultyId() {
            return facultyId;
        }

        public void setFacultyId(String facultyId) {
            this.facultyId = facultyId;
        }

        public String getCourseName() {
            return courseName;
        }

        public void setCourseName(String courseName) {
            this.courseName = courseName;
        }

        public String getCourseSection() {
            return courseSection;
        }

        public void setCourseSection(String courseSection) {
            this.courseSection = courseSection;
        }

        public String getCreateTime() {
            return createTime;
        }

        public void setCreateTime(String createTime) {
            this.createTime = createTime;
        }

        @Override
        public String toString() {
            return "CLASSROOM{" +
                    "roomNo=" + roomNo +
                    ", roomID='" + roomId + '\'' +
                    ", facultyId='" + facultyId + '\'' +
                    ", courseName=" + courseName + '\'' +
                    ", courseSection=" + courseSection + '\'' +
                    ", createTime=" + createTime +
                    '}';
        }


}

package com.model.viewmodel;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;


public class StudentSignupVM {

    @NotNull
    @Pattern(regexp="^[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]-[1-3]$", message = "Student ID format must be XX-XXXXX-X")
    private String studentID;


    private MultipartFile picture;


    @NotNull
    private String firstName;

    @NotNull
    private String lastName;

    @NotNull
    private String gender;

    @NotNull
    @Pattern(regexp="^[a-z0-9_+&*-]+(?:\\."+
            "[a-z0-9_+&*-]+)*@" +
            "(?:[a-z0-9-]+\\.)+[a-z" +
            "]{2,7}$", message = "This is not a valid mail address")
    private String email;
    @NotNull
    @Pattern(regexp="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,32}$", message = "8-32 MAX & 1-Capital,small,special,number")
    private String password;

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public MultipartFile getPicture() {
        return picture;
    }

    public void setPicture(MultipartFile picture) {
        this.picture = picture;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

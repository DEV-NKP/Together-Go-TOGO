package com.service;

import com.model.STUDENT_REGISTER;

import java.util.List;

public interface STUDENT_REGISTERService {
    public List<STUDENT_REGISTER> getAll();

    public void save(STUDENT_REGISTER student_register);

    public STUDENT_REGISTER get(int id);

    List<STUDENT_REGISTER> findByStudentId(String username);


    public void update(STUDENT_REGISTER student_register);

    public void delete(int id);


    ///NEW METHODS FROM THE PREVIOUS PROJECT

    public void deleteStudent(String studentId, String roomId);
    public List<STUDENT_REGISTER> searchbyRoomID(String roomId);
    public STUDENT_REGISTER checkregistered(String studentId, String roomId);
    public List<STUDENT_REGISTER>  searchbyStudentID(String studentId);
}

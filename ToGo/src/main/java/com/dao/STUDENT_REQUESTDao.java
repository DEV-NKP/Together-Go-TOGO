package com.dao;

import com.model.STUDENT_REQUEST;

import java.util.List;

public interface STUDENT_REQUESTDao {

    public List<STUDENT_REQUEST> getAll();

    public void save(STUDENT_REQUEST userContact);

    public STUDENT_REQUEST get(int id);


    public void update(STUDENT_REQUEST userContact);

    public void delete(int id);

    ///NEW METHODS FROM THE PREVIOUS PROJECT

    public STUDENT_REQUEST checkRequested(String stuId, String roomId);

    public List<STUDENT_REQUEST> searchRequestRoom(String roomId);
    public void deleteRequested(String studentId, String roomId);
}

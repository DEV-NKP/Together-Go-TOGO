package com.dao;


import com.model.STUDENT;

import java.util.List;

public interface STUDENTDao {

    public List<STUDENT> getAll();

    public void save(STUDENT student);

    public STUDENT getid(String id);
    public STUDENT getemail(String email);

    public void update(STUDENT student);

    public void delete(String id);
}

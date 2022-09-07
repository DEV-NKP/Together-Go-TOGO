package com.dao;

import com.model.SUBMIT_TASK;

import java.util.List;

public interface SUBMIT_TASKDao {

    public List<SUBMIT_TASK> getAll();

    public void save(SUBMIT_TASK submit);

    public List<SUBMIT_TASK>  get(int id);
    public SUBMIT_TASK  checkSubmit(int id, String studentId);
    public void update(SUBMIT_TASK submit);

    public void delete(int id);
}

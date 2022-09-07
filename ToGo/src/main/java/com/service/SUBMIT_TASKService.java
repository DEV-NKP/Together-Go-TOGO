package com.service;

import com.model.SUBMIT_TASK;

import java.util.List;

public interface SUBMIT_TASKService {

    public List<SUBMIT_TASK> getAll();

    public void save(SUBMIT_TASK submit_task);

    public List<SUBMIT_TASK>  get(int id);

    public void update(SUBMIT_TASK submit_task);
    public SUBMIT_TASK  checkSubmit(int id, String studentId);
    public void delete(int id);
}

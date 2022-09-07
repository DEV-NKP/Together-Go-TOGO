package com.service;

import com.dao.SUBMIT_TASKDao;
import com.model.SUBMIT_TASK;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class SUBMIT_TASKServiceImpl implements SUBMIT_TASKService{


    private final SUBMIT_TASKDao submit_taskDao;

    public SUBMIT_TASKServiceImpl(SUBMIT_TASKDao submit_taskDao) {
        this.submit_taskDao = submit_taskDao;
    }

    @Override
    @Transactional(readOnly = true)
    public List<SUBMIT_TASK> getAll() {
        return submit_taskDao.getAll();
    }

    @Override
    public void save(SUBMIT_TASK submit_task) {
        submit_taskDao.save(submit_task);
    }

    @Override
    public List<SUBMIT_TASK>  get(int id) {
        return submit_taskDao.get(id);
    }

    @Override
    public void update(SUBMIT_TASK submit_task) {
        submit_taskDao.update(submit_task);
    }
    @Override
    public SUBMIT_TASK  checkSubmit(int id, String studentId)
    {
            return submit_taskDao.checkSubmit(id, studentId);
    }

    @Override
    public void delete(int id) {
        submit_taskDao.delete(id);
    }
}

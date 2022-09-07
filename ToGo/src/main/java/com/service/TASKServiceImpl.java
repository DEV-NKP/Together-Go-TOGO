package com.service;

import com.dao.TASKDao;
import com.model.TASK;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class TASKServiceImpl implements TASKService{


    private final TASKDao taskDao;

    public TASKServiceImpl(TASKDao taskDao) {
        this.taskDao = taskDao;
    }

    @Override
    @Transactional(readOnly = true)
    public List<TASK> getAll() {
        return taskDao.getAll();
    }

    @Override
    public void save(TASK task) {
        taskDao.save(task);
    }

    @Override
    public TASK get(int id) {
        return taskDao.get(id);
    }

    @Override
    public void update(TASK task) {
        taskDao.update(task);
    }

    @Override
    public void delete(int id) {
        taskDao.delete(id);
    }

    @Override
    public List<TASK> findByRoomId(String roomId) {
        return taskDao.findByRoomId(roomId);
    }
}

package com.service;

import com.dao.FACULTYDao;
import com.model.FACULTY;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class FACULTYServiceImpl implements FACULTYService{

    private final FACULTYDao facultyDao;

    public FACULTYServiceImpl(FACULTYDao facultyDao) {
        this.facultyDao = facultyDao;
    }

    @Override
    @Transactional(readOnly = true)
    public List<FACULTY> getAll() {
        return facultyDao.getAll();
    }

    @Override
    public void save(FACULTY faculty) {
        facultyDao.save(faculty);
    }

    @Override
    public FACULTY get(String id) {
        return facultyDao.get(id);
    }

    @Override
    public void update(FACULTY faculty) {
        facultyDao.update(faculty);
    }

    @Override
    public void delete(String id) {
        facultyDao.delete(id);
    }
}

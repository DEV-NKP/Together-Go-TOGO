package com.service;

import com.dao.STUDENTDao;
import com.model.STUDENT;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class STUDENTServiceImpl implements STUDENTService{


    private final STUDENTDao studentDao;

    public STUDENTServiceImpl(STUDENTDao studentDao) {
        this.studentDao = studentDao;
    }

    @Override
    @Transactional(readOnly = true)
    public List<STUDENT> getAll() {
        return studentDao.getAll();
    }

    @Override
    public void save(STUDENT student) {
        studentDao.save(student);
    }

    @Override
    public STUDENT getid(String id) {
        return studentDao.getid(id);
    }

    @Override
    public STUDENT getemail(String email) {
        return studentDao.getemail(email);
    }

    @Override
    public void update(STUDENT student) {
        studentDao.update(student);
    }

    @Override
    public void delete(String id) {
        studentDao.delete(id);
    }
}

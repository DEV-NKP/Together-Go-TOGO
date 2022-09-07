package com.service;

import com.dao.STUDENT_REQUESTDao;
import com.model.STUDENT_REQUEST;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class STUDENT_REQUESTServiceImpl implements STUDENT_REQUESTService{

    private final STUDENT_REQUESTDao student_requestDao;

    public STUDENT_REQUESTServiceImpl(STUDENT_REQUESTDao student_requestDao) {
        this.student_requestDao = student_requestDao;
    }

    @Override
    @Transactional(readOnly = true)
    public List<STUDENT_REQUEST> getAll() {
        return student_requestDao.getAll();
    }

    @Override
    public void save(STUDENT_REQUEST student_request) {
        student_requestDao.save(student_request);
    }

    @Override
    public STUDENT_REQUEST get(int id) {
        return student_requestDao.get(id);
    }

    @Override
    public void update(STUDENT_REQUEST student_request) {
        student_requestDao.update(student_request);
    }

    @Override
    public void delete(int id) {
        student_requestDao.delete(id);
    }

    ///NEW METHODS FROM THE PREVIOUS PROJECT

    @Override
    public STUDENT_REQUEST checkRequested(String stuId, String roomId) {
        return student_requestDao.checkRequested(stuId, roomId);
    }

    @Override
    public List<STUDENT_REQUEST> searchRequestRoom(String roomId) {
        return student_requestDao.searchRequestRoom(roomId);
    }

    @Override
    public void deleteRequested(String studentId, String roomId) {
        student_requestDao.deleteRequested(studentId,roomId);
    }
}

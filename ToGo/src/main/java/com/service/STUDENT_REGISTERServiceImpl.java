package com.service;

import com.dao.STUDENT_REGISTERDao;
import com.model.STUDENT_REGISTER;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class STUDENT_REGISTERServiceImpl implements STUDENT_REGISTERService{

    private final STUDENT_REGISTERDao student_registerDao;

    public STUDENT_REGISTERServiceImpl(STUDENT_REGISTERDao student_registerDao) {
        this.student_registerDao = student_registerDao;
    }

    @Override
    @Transactional(readOnly = true)
    public List<STUDENT_REGISTER> getAll() {
        return student_registerDao.getAll();
    }

    @Override
    public void save(STUDENT_REGISTER student_register) {
        student_registerDao.save(student_register);
    }

    @Override

    public STUDENT_REGISTER get(int id) {
        return student_registerDao.get(id);
    }
    @Override

    public STUDENT_REGISTER checkregistered(String studentId, String roomId) {
        return student_registerDao.checkregistered(studentId,roomId);
    }

    @Override
    public List<STUDENT_REGISTER> findByStudentId(String username) {
        return student_registerDao.findByStudentId(username);
    }

    @Override
    public void update(STUDENT_REGISTER student_register) {
        student_registerDao.update(student_register);
    }

    @Override
    public void delete(int id) {
        student_registerDao.delete(id);
    }

    ///NEW METHODS FROM THE PREVIOUS PROJECT

    @Override
    public void deleteStudent(String studentId, String roomId) {
         student_registerDao.deleteStudent(studentId, roomId);
    }
    @Override
    public List<STUDENT_REGISTER>  searchbyStudentID(String studentId) {
        return student_registerDao.searchbyStudentID(studentId);
    }

    @Override
    public List<STUDENT_REGISTER> searchbyRoomID(String roomId) {
        return student_registerDao.searchbyRoomID(roomId);
    }
}

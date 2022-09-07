package com.service;

import com.dao.CLASSROOMDao;
import com.model.CLASSROOM;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class CLASSROOMServiceImpl implements CLASSROOMService{

    private final CLASSROOMDao classroomDao;

    public CLASSROOMServiceImpl(CLASSROOMDao classroomDao) {
        this.classroomDao = classroomDao;
    }

    @Override
    @Transactional(readOnly = true)
    public List<CLASSROOM> getAll() {
        return classroomDao.getAll();
    }

    @Override
    public void save(CLASSROOM classroom) {
        classroomDao.save(classroom);
    }

    @Override
    public CLASSROOM get(int id) {
        return classroomDao.get(id);
    }

    @Override
    public void update(CLASSROOM classroom) {
        classroomDao.update(classroom);
    }

    @Override
    public void delete(int id) {
        classroomDao.delete(id);
    }
   
	
    ///NEW METHODS FROM THE PREVIOUS PROJECT
    public void deleteByRoomID(String roomID) {
        classroomDao.deleteByRoomID(roomID);
    }

    @Override
    public CLASSROOM courseSearch(String name) {
        return classroomDao.courseSearch(name);
    }
    @Override
    public CLASSROOM findByRoomId(String roomId) {
        return classroomDao.findByRoomId(roomId);
    }

    public List<CLASSROOM> findSearch(String text) {
        return classroomDao.findSearch(text);
    }

    @Override
    public List<CLASSROOM> searchByFac(String id) {
        return classroomDao.searchByFac(id);
    }
}

package com.service;

import com.dao.ADMINDao;
import com.model.ADMIN;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class ADMINServiceImpl implements ADMINService{

    private final ADMINDao adminDao;

    public ADMINServiceImpl(ADMINDao adminDao) {
        this.adminDao = adminDao;
    }

    @Override
    @Transactional(readOnly = true)
    public List<ADMIN> getAll() {
        return adminDao.getAll();
    }

    @Override
    public void save(ADMIN admin) {
        adminDao.save(admin);
    }

    @Override
    public ADMIN get(String id) {
        return adminDao.get(id);
    }

    @Override
    public void update(ADMIN admin) {
        adminDao.update(admin);
    }

    @Override
    public void delete(String id) {
        adminDao.delete(id);
    }
}

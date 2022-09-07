package com.dao;

import com.model.ADMIN;

import java.util.List;

public interface ADMINDao {

    public List<ADMIN> getAll();

    public void save(ADMIN admin);

    public ADMIN get(String id);

    public void update(ADMIN admin);

    public void delete(String id);
}

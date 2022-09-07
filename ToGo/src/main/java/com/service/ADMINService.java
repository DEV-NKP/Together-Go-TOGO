package com.service;

import com.model.ADMIN;
import com.model.CLASSROOM;

import java.util.List;

public interface ADMINService {
    public List<ADMIN> getAll();

    public void save(ADMIN admin);

    public ADMIN get(String id);

    public void update(ADMIN admin);

    public void delete(String id);
}

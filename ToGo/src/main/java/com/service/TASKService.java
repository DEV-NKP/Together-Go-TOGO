package com.service;

import com.model.TASK;

import java.util.List;

public interface TASKService {

    public List<TASK> getAll();

    public void save(TASK task);

    public TASK get(int id);

    public void update(TASK task);

    public void delete(int id);

    public List<TASK> findByRoomId(String roomId);

}

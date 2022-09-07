package com.dao;

import com.model.CLASSROOM;

import java.util.List;

public interface CLASSROOMDao {

    public List<CLASSROOM> getAll();

    public void save(CLASSROOM classroom);

    public CLASSROOM get(int id);

    public void update(CLASSROOM classroom);

    public void delete(int id);

    ///NEW METHODS FROM THE PREVIOUS PROJECT

    public CLASSROOM courseSearch(String name);
    public CLASSROOM findByRoomId(String roomId);

    List<CLASSROOM> findSearch(String text);

    List<CLASSROOM> searchByFac(String id);

    public void deleteByRoomID(String roomID);

}

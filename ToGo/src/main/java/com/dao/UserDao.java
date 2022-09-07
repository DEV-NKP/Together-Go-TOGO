package com.dao;

import com.model.TASK;
import com.model.User;

import java.util.List;


public interface UserDao {

    User findByUsername(String username);
    public List<User> getAll();

    public void save(User user);

    public User get(String username);
    public User checkuser(String username, String password);
    public void update(User user);

    public User getemail(String email);
    public void delete(String id);
}

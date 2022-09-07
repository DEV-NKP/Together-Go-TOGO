package com.service;

import com.model.TASK;
import com.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService{

    public List<User> getAll();

    public void save(User task);

    public User get(String username);
    public  User checkuser(String username, String password);
    public void update(User user);

    public void delete(String id);
    public User getemail(String email);
}

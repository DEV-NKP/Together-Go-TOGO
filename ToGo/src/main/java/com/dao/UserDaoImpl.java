package com.dao;

import com.model.FACULTY;
import com.model.TASK;
import com.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
    private SessionFactory sessionFactory;

    public UserDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public User findByUsername(String username) {
        Session session = sessionFactory.getCurrentSession();
        try {
            Query<User> userQuery = session.createQuery("from User where username = :username", User.class);
            userQuery.setParameter("username", username);
            return userQuery.getSingleResult();
        } catch (NoResultException nre){

        }

        return null;
    }


    @Override
    public List<User> getAll() {
        Session session = this.sessionFactory.getCurrentSession();
        try {
            Query<User> userQuery = session.createQuery("from User", User.class);
            List<User> users = userQuery.getResultList();
            return users == null ? new ArrayList<User>() : users;
        } catch (NoResultException nre){

        }

        return null;
    }

    @Override
    public void save(User userContact) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(userContact);
    }

    @Override
    public User get(String username) {

        Session session = sessionFactory.getCurrentSession();
        try {

            Query<User> userQuery = session.createQuery("from User where username = :username", User.class);
            userQuery.setParameter("username", username);
            User user = userQuery.getSingleResult();
            return user;
        }  catch (NoResultException nre){

        }

        return null;

    }

    @Override
    public User checkuser(String username, String password) {

        Session session = sessionFactory.getCurrentSession();
        try {

            Query<User> userQuery = session.createQuery("from User where username = :username and password = :password", User.class);
            userQuery.setParameter("username", username);
            userQuery.setParameter("password", password);
            User user = userQuery.getSingleResult();
            return user;
        }  catch (NoResultException nre){

               }

        return null;

    }

    @Override
    public void update(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
    }

    @Override
    public void delete(String id) {
        User user = get(id);
        sessionFactory.getCurrentSession().delete(user);
    }


    @Override
    public User getemail(String email) {

        Session session = sessionFactory.getCurrentSession();
        try {

            Query<User> userQuery = session.createQuery("from User where email = :email", User.class);
            userQuery.setParameter("email", email);

            User user = userQuery.getSingleResult();
            return user;
        }  catch (NoResultException nre){

        }

        return null;
    }



}

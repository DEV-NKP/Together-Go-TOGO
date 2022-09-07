package com.dao;

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
public class TASKDaoImpl implements TASKDao {

    private final SessionFactory sessionFactory;

    public TASKDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<TASK> getAll() {
        Session session = this.sessionFactory.getCurrentSession();
        try {
            Query<TASK> userQuery = session.createQuery("from TASK", TASK.class);
            List<TASK> tasks = userQuery.getResultList();
            return tasks == null ? new ArrayList<TASK>() : tasks;
        } catch (NoResultException nre){

        }

        return null;
    }

    @Override
    public void save(TASK userContact) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(userContact);
    }

    @Override
    public TASK get(int id) {
        Session session = sessionFactory.getCurrentSession();
        try {

            Query<TASK> userQuery = session.createQuery("from TASK where taskId = :id", TASK.class);
            userQuery.setParameter("id", id);
            TASK t = userQuery.getSingleResult();
            return t;
        }  catch (NoResultException nre){

        }

        return null;
    }



    @Override
    public void update(TASK task) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(task);
    }

    @Override
    public void delete(int id) {
        TASK task = get(id);
        sessionFactory.getCurrentSession().delete(task);
    }

    @Override
    public List<TASK> findByRoomId(String roomId){
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<TASK> courseQuery = session.createQuery("from TASK where roomId = :roomId", TASK.class);
            courseQuery.setParameter("roomId", roomId);
            return courseQuery.getResultList();
        }
        catch (NoResultException nre){

        }

        return null;
    }


}

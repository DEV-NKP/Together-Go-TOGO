package com.dao;

import com.model.SUBMIT_TASK;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.List;
@Repository
public class SUBMIT_TASKDaoImpl implements SUBMIT_TASKDao {

    private final SessionFactory sessionFactory;

    public SUBMIT_TASKDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<SUBMIT_TASK> getAll() {
        Session session = this.sessionFactory.getCurrentSession();
        try {
            Query<SUBMIT_TASK> userQuery = session.createQuery("from SUBMIT_TASK", SUBMIT_TASK.class);
            List<SUBMIT_TASK> submit_tasks = userQuery.getResultList();
            return submit_tasks == null ? new ArrayList<SUBMIT_TASK>() : submit_tasks;
        } catch (NoResultException nre){

        }

        return null;
    }

    @Override
    public void save(SUBMIT_TASK userContact) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(userContact);
    }

    @Override
    public List<SUBMIT_TASK> get(int id) {
        Session session = sessionFactory.getCurrentSession();
        try {

            Query<SUBMIT_TASK> userQuery = session.createQuery("from SUBMIT_TASK where taskId = :id", SUBMIT_TASK.class);
            userQuery.setParameter("id", id);

            return userQuery.getResultList();
        }  catch (NoResultException nre){

        }

        return null;
    }

    @Override
    public SUBMIT_TASK  checkSubmit(int id, String studentId) {
        Session session = sessionFactory.getCurrentSession();
        try {

            Query<SUBMIT_TASK> userQuery = session.createQuery("from SUBMIT_TASK where taskId = :id and studentId = :studentId", SUBMIT_TASK.class);
            userQuery.setParameter("id", id);
            userQuery.setParameter("studentId", studentId);
            return userQuery.getSingleResult();
        }  catch (NoResultException nre){

        }

        return null;
    }


    public SUBMIT_TASK getprimary(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(SUBMIT_TASK.class, id);
    }

    @Override
    public void update(SUBMIT_TASK submit_task) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(submit_task);
    }

    @Override
    public void delete(int id) {
        SUBMIT_TASK submit_task = getprimary(id);
        sessionFactory.getCurrentSession().delete(submit_task);
    }
}

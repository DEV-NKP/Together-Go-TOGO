package com.dao;

import com.model.CLASSROOM;
import com.model.STUDENT_REQUEST;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.List;
@Repository
public class STUDENT_REQUESTDaoImpl implements STUDENT_REQUESTDao{

    private final SessionFactory sessionFactory;

    public STUDENT_REQUESTDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<STUDENT_REQUEST> getAll() {
        Session session = this.sessionFactory.getCurrentSession();
        try {
            Query<STUDENT_REQUEST> userQuery = session.createQuery("from STUDENT_REQUEST", STUDENT_REQUEST.class);
            List<STUDENT_REQUEST> student_requests = userQuery.getResultList();
            return student_requests == null ? new ArrayList<STUDENT_REQUEST>() : student_requests;
        } catch (NoResultException nre){

        }

        return null;
    }

    @Override
    public void save(STUDENT_REQUEST userContact) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(userContact);
    }

    @Override
    public STUDENT_REQUEST get(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(STUDENT_REQUEST.class, id);
    }

    @Override
    public void update(STUDENT_REQUEST student_request) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(student_request);
    }

    @Override
    public void delete(int id) {
        STUDENT_REQUEST student_request = get(id);
        sessionFactory.getCurrentSession().delete(student_request);
    }


    ///NEW METHODS FROM THE PREVIOUS PROJECT

    public STUDENT_REQUEST checkRequested(String studentId, String roomId) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<STUDENT_REQUEST> courseQuery = session.createQuery("from STUDENT_REQUEST where studentId = :studentId and roomId = :roomId", STUDENT_REQUEST.class);
            courseQuery.setParameter("studentId", studentId);
            courseQuery.setParameter("roomId", roomId);
            STUDENT_REQUEST student_requests = courseQuery.getSingleResult();
            return student_requests;
        } catch (NoResultException nre){

        }

        return null;
    }

    public List<STUDENT_REQUEST> searchRequestRoom(String roomId) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<STUDENT_REQUEST> requestQuery = session.createQuery("from STUDENT_REQUEST where roomId = :roomId", STUDENT_REQUEST.class);
            requestQuery.setParameter("roomId", roomId);
            List<STUDENT_REQUEST> roomRequest = requestQuery.getResultList();
            return roomRequest;
        }
        catch (NoResultException nre){

        }

        return null;
    }


    public void deleteRequested(String studentId, String roomId) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<STUDENT_REQUEST> courseQuery = session.createQuery("from STUDENT_REQUEST where studentId = :studentId and roomId = :roomId", STUDENT_REQUEST.class);
            courseQuery.setParameter("studentId", studentId);
            courseQuery.setParameter("roomId", roomId);
            STUDENT_REQUEST student_requests = courseQuery.getSingleResult();
            sessionFactory.getCurrentSession().delete(student_requests);
        } catch (NoResultException nre){

        }

    }


}

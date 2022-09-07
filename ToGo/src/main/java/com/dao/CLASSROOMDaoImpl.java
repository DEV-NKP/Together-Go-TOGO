package com.dao;

import com.model.CLASSROOM;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.List;
@Repository
public class CLASSROOMDaoImpl implements CLASSROOMDao {
    private final SessionFactory sessionFactory;

    public CLASSROOMDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<CLASSROOM> getAll() {
        Session session = this.sessionFactory.getCurrentSession();
        try {
            Query<CLASSROOM> userQuery = session.createQuery("from CLASSROOM", CLASSROOM.class);
            List<CLASSROOM> classrooms = userQuery.getResultList();
            return classrooms == null ? new ArrayList<CLASSROOM>() : classrooms;
        } catch (NoResultException nre){

        }

        return null;
    }

    @Override
    public void save(CLASSROOM userContact) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(userContact);
    }

    @Override
    public CLASSROOM get(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(CLASSROOM.class, id);
    }

    @Override
    public void update(CLASSROOM classroom) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(classroom);
    }

    @Override
    public void delete(int id) {
        CLASSROOM classroom = get(id);
        sessionFactory.getCurrentSession().delete(classroom);
    }

    ///NEW METHODS FROM THE PREVIOUS PROJECT


    @Override
    public void deleteByRoomID(String roomID) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<CLASSROOM> courseQuery = session.createQuery("from CLASSROOM where roomId = :roomID", CLASSROOM.class);
            courseQuery.setParameter("roomID", roomID);
            sessionFactory.getCurrentSession().delete(courseQuery.getSingleResult());

        }catch (NoResultException nre){

        }

    }
    @Override
    public CLASSROOM courseSearch(String courseName){
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<CLASSROOM> courseQuery = session.createQuery("from CLASSROOM where courseName = :courseName", CLASSROOM.class);
            courseQuery.setParameter("courseName", courseName);
            return courseQuery.getSingleResult();
        }
        catch (NoResultException nre){

        }

        return null;
    }

    @Override
    public CLASSROOM findByRoomId(String roomId){
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<CLASSROOM> courseQuery = session.createQuery("from CLASSROOM where roomId = :roomId", CLASSROOM.class);
            courseQuery.setParameter("roomId", roomId);
            return courseQuery.getSingleResult();
        }
        catch (NoResultException nre){

        }

        return null;

    }


    @Override
    public List<CLASSROOM> findSearch(String text){
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<CLASSROOM> courseQuery = session.createQuery("from CLASSROOM where roomId like :text or courseName like :text", CLASSROOM.class);
            courseQuery.setParameter("text", '%'+text+'%');
            return courseQuery.getResultList();
        }
        catch (NoResultException nre){

        }

        return null;

    }

    @Override
    public List<CLASSROOM> searchByFac(String facultyId){
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<CLASSROOM> courseQuery = session.createQuery("from CLASSROOM where facultyId = :facultyId", CLASSROOM.class);
            courseQuery.setParameter("facultyId", facultyId);
            return courseQuery.getResultList();
        }
        catch (NoResultException nre){

        }

        return null;
    }



}

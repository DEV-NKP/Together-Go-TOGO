package com.dao;

import com.model.STUDENT_REGISTER;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.List;
@Repository
public class STUDENT_REGISTERDaoImpl implements STUDENT_REGISTERDao{


    private final SessionFactory sessionFactory;

    public STUDENT_REGISTERDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<STUDENT_REGISTER> getAll() {
        Session session = this.sessionFactory.getCurrentSession();
        try {
            Query<STUDENT_REGISTER> userQuery = session.createQuery("from STUDENT_REGISTER", STUDENT_REGISTER.class);
            List<STUDENT_REGISTER> student_registers = userQuery.getResultList();
            return student_registers == null ? new ArrayList<STUDENT_REGISTER>() : student_registers;
        } catch (NoResultException nre){

        }

        return null;
    }

    @Override
    public List<STUDENT_REGISTER> findByStudentId(String username) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<STUDENT_REGISTER> userQuery = session.createQuery("from STUDENT_REGISTER where studentId = :username", STUDENT_REGISTER.class);
            userQuery.setParameter("username", username);
            return userQuery.getResultList();
        }
        catch (NoResultException nre){

        }

        return null;
    }


    @Override
    public void save(STUDENT_REGISTER userContact) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(userContact);
    }

    @Override
    public STUDENT_REGISTER get(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(STUDENT_REGISTER.class, id);
    }


    @Override
    public void update(STUDENT_REGISTER student_register) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(student_register);
    }

    @Override
    public void delete(int id) {
        STUDENT_REGISTER student_register = get(id);
        sessionFactory.getCurrentSession().delete(student_register);
    }

    ///NEW METHODS FROM THE PREVIOUS PROJECT
    @Override
    public void deleteStudent(String studentId, String roomId) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<STUDENT_REGISTER> registerQuery = session.createQuery("from STUDENT_REGISTER where studentId = :studentId and roomId = :roomId", STUDENT_REGISTER.class);
            registerQuery.setParameter("studentId", studentId);
            registerQuery.setParameter("roomId", roomId);

            sessionFactory.getCurrentSession().delete(registerQuery.getSingleResult());

        }
        catch (NoResultException nre){

        }

    }
    @Override
    public STUDENT_REGISTER checkregistered(String studentId, String roomId) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<STUDENT_REGISTER> registerQuery = session.createQuery("from STUDENT_REGISTER where studentId = :studentId and roomId = :roomId", STUDENT_REGISTER.class);
            registerQuery.setParameter("studentId", studentId);
            registerQuery.setParameter("roomId", roomId);
            return registerQuery.getSingleResult();


        }
        catch (NoResultException nre){

        }
        return null;
    }
    @Override
    public List<STUDENT_REGISTER> searchbyRoomID(String roomId) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<STUDENT_REGISTER> registerQuery = session.createQuery("from STUDENT_REGISTER where roomId = :roomId", STUDENT_REGISTER.class);
            registerQuery.setParameter("roomId", roomId);
            return registerQuery.getResultList();
        }
        catch (NoResultException nre){

        }
        return null;
    }
    @Override
    public List<STUDENT_REGISTER>  searchbyStudentID(String studentId) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Query<STUDENT_REGISTER> registerQuery = session.createQuery("from STUDENT_REGISTER where studentId = :studentId", STUDENT_REGISTER.class);
            registerQuery.setParameter("studentId", studentId);
            return registerQuery.getResultList();

        }
        catch (NoResultException nre){

        }
return null;
    }
}

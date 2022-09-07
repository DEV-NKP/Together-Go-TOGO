package com.dao;

import com.model.STUDENT;
import com.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.List;
@Repository
public class STUDENTDaoImpl implements STUDENTDao {
    private final SessionFactory sessionFactory;

    public STUDENTDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<STUDENT> getAll() {
        Session session = this.sessionFactory.getCurrentSession();
        try {
            Query<STUDENT> userQuery = session.createQuery("from STUDENT", STUDENT.class);
            List<STUDENT> students = userQuery.getResultList();
            return students == null ? new ArrayList<STUDENT>() : students;
        } catch (NoResultException nre){

        }

        return null;
    }

    @Override
    public void save(STUDENT userContact) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(userContact);
    }

    @Override
    public STUDENT getid(String id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(STUDENT.class, id);
    }

    @Override
    public STUDENT getemail(String email) {

        Session session = sessionFactory.getCurrentSession();
        try {

            Query<STUDENT> userQuery = session.createQuery("from STUDENT where EMAIL = :email", STUDENT.class);
            userQuery.setParameter("email", email);

            STUDENT student = userQuery.getSingleResult();
            return student;
        }  catch (NoResultException nre){

        }

        return null;
    }

    @Override
    public void update(STUDENT student) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(student);
    }

    @Override
    public void delete(String id) {
        STUDENT student = getid(id);
        sessionFactory.getCurrentSession().delete(student);
    }
}

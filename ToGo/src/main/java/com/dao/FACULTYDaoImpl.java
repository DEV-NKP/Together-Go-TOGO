package com.dao;

import com.model.FACULTY;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.List;
@Repository
public class FACULTYDaoImpl implements FACULTYDao {
    private final SessionFactory sessionFactory;

    public FACULTYDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<FACULTY> getAll() {

        Session session = this.sessionFactory.getCurrentSession();
        try {
            Query<FACULTY> userQuery = session.createQuery("from FACULTY", FACULTY.class);
            List<FACULTY> faculties = userQuery.getResultList();
            return faculties == null ? new ArrayList<FACULTY>() : faculties;
        } catch (NoResultException nre){

        }

        return null;
    }

    @Override
    public void save(FACULTY userContact) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(userContact);
    }

    @Override
    public FACULTY get(String id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(FACULTY.class, id);
    }

    @Override
    public void update(FACULTY faculty) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(faculty);
    }

    @Override
    public void delete(String id) {
        FACULTY faculty = get(id);
        sessionFactory.getCurrentSession().delete(faculty);
    }
}

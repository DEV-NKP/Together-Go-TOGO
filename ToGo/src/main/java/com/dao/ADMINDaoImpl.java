package com.dao;

import com.model.ADMIN;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class ADMINDaoImpl implements ADMINDao {

    private final SessionFactory sessionFactory;

    public ADMINDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<ADMIN> getAll() {
        Session session = this.sessionFactory.getCurrentSession();
        try {
            Query<ADMIN> userQuery = session.createQuery("from ADMIN", ADMIN.class);
            List<ADMIN> admins = userQuery.getResultList();
            return admins == null ? new ArrayList<ADMIN>() : admins;
        } catch (NoResultException nre){

        }

        return null;
    }

    @Override
    public void save(ADMIN userContact) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(userContact);
    }

    @Override
    public ADMIN get(String id) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.get(ADMIN.class, id);
    }

    @Override
    public void update(ADMIN admin) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(admin);
    }

    @Override
    public void delete(String id) {
        ADMIN admin = get(id);
        sessionFactory.getCurrentSession().delete(admin);
    }
}

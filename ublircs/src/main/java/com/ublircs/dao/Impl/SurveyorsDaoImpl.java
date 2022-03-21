package com.ublircs.dao.Impl;

import com.ublircs.dao.SurveyorsDao;
import com.ublircs.model.Surveyors;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Repository
@Transactional
public class SurveyorsDaoImpl implements SurveyorsDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<Surveyors> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Surveyors");
        List<Surveyors> surveyorsList = query.list();
        return surveyorsList;
    }

    public Surveyors findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Surveyors surveyors = (Surveyors) session.get(Surveyors.class, id);
        session.flush();

        return surveyors;
    }

    public Surveyors findByUserName(String userName) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Surveyors s WHERE s.userName = :userName");
        query.setParameter("userName", userName);
        Surveyors surveyors = (Surveyors) query.uniqueResult();
        session.flush();

        return surveyors;

    }

    public Surveyors findUserByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Surveyors s WHERE s.email = :email");
        query.setParameter("email", email);
        Surveyors surveyors = (Surveyors) query.uniqueResult();
        session.flush();
        return surveyors;
    }

    public Surveyors findUserByCode(String code) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Surveyors s WHERE s.surveyorCode = :code");
        query.setParameter("code", code);
        Surveyors surveyors = (Surveyors) query.uniqueResult();
        session.flush();
        return surveyors;
    }

    public void add(Surveyors surveyors) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(surveyors);
        session.flush();
    }

    public void edit(Surveyors surveyors) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(surveyors);
        session.flush();
    }
}

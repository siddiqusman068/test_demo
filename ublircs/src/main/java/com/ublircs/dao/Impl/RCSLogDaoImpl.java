package com.ublircs.dao.Impl;

import com.ublircs.dao.RCSLogDao;
import com.ublircs.model.RCSLog;
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
public class RCSLogDaoImpl implements RCSLogDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<RCSLog> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RCSLog");
        List<RCSLog> rcsLogslist = query.list();
        session.flush();

        return rcsLogslist;
    }

    public List<RCSLog> findAllLogsByRAFormId(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RCSLog WHERE RAFormId = :RAFormId");
        query.setParameter("RAFormId", id);
        List<RCSLog> rcsLogList = query.list();
        session.flush();

        return rcsLogList;
    }

    public RCSLog findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        RCSLog rcsLog = (RCSLog) session.get(RCSLog.class, id);
        session.flush();
        return rcsLog;
    }

    public void add(RCSLog rcsLog) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(rcsLog);
        session.flush();
    }
}

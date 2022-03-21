package com.ublircs.dao.Impl;

import com.ublircs.dao.RiskSpecificOilFeedDao;
import com.ublircs.model.RiskSpecificOilFeed;
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
public class RiskSpecificOilFeedDaoImpl implements RiskSpecificOilFeedDao {

    @Autowired
    private SessionFactory sessionFactory;

    public List<RiskSpecificOilFeed> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RickSpecificOilFeed");
        List<RiskSpecificOilFeed> rickSpecificOilFeedList = query.list();
        session.flush();

        return rickSpecificOilFeedList;
    }

    public RiskSpecificOilFeed findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        RiskSpecificOilFeed rickSpecificOilFeed = (RiskSpecificOilFeed) session.get(RiskSpecificOilFeed.class, id);
        session.flush();

        return rickSpecificOilFeed;
    }

    public RiskSpecificOilFeed findByRAForm(int raformsId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RiskSpecificOilFeed  WHERE RAformId = :RAformId");
        query.setParameter("RAformId", raformsId);
        RiskSpecificOilFeed riskSpecificOilFeed = (RiskSpecificOilFeed) query.uniqueResult();
        session.flush();

        return riskSpecificOilFeed;
    }


    public void add(RiskSpecificOilFeed rickSpecificOilFeed) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(rickSpecificOilFeed);
        session.flush();
    }

    public void edit(RiskSpecificOilFeed rickSpecificOilFeed) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(rickSpecificOilFeed);
        session.flush();
    }
}

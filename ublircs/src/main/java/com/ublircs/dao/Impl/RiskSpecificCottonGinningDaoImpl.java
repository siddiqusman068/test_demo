package com.ublircs.dao.Impl;

import com.ublircs.dao.RiskSpecificCottonGinningDao;
import com.ublircs.model.RiskSpecificCottonGinning;
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
public class RiskSpecificCottonGinningDaoImpl implements RiskSpecificCottonGinningDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<RiskSpecificCottonGinning> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RiskSpecificCottonGinning");
        List<RiskSpecificCottonGinning> riskSpecificCottonGinningList = query.list();
        session.flush();

        return riskSpecificCottonGinningList;
    }

    public RiskSpecificCottonGinning findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        RiskSpecificCottonGinning riskSpecificCottonGinning = (RiskSpecificCottonGinning) session.get(RiskSpecificCottonGinning.class, id);
        session.flush();

        return riskSpecificCottonGinning;
    }

    public RiskSpecificCottonGinning findByRAForm(int raformsId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RiskSpecificCottonGinning WHERE RAformId = :RAformId");
        query.setParameter("RAformId", raformsId);
        RiskSpecificCottonGinning riskSpecificCottonGinning = (RiskSpecificCottonGinning) query.uniqueResult();
        session.flush();

        return  riskSpecificCottonGinning;
    }

    public void add(RiskSpecificCottonGinning riskSpecificCottonGinning) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(riskSpecificCottonGinning);
        session.flush();
    }

    public void edit(RiskSpecificCottonGinning riskSpecificCottonGinning) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(riskSpecificCottonGinning);
        session.flush();
    }
}

package com.ublircs.dao.Impl;

import com.ublircs.dao.RiskSpecificTextileGarmentSpinningDao;
import com.ublircs.model.RiskSpecificTextileGarmentSpinning;
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
public class RiskSpecificTextileGarmentSpinningDaoImpl implements RiskSpecificTextileGarmentSpinningDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<RiskSpecificTextileGarmentSpinning> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RiskSpecificTextileGarmentSpinning");
        List<RiskSpecificTextileGarmentSpinning> riskSpecificTextileGarmentSpinningsList = query.list();
        session.flush();

        return riskSpecificTextileGarmentSpinningsList;
    }

    public RiskSpecificTextileGarmentSpinning findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        RiskSpecificTextileGarmentSpinning riskSpecificTextileGarmentSpinning = (RiskSpecificTextileGarmentSpinning) session.get(RiskSpecificTextileGarmentSpinning.class, id);
        session.flush();

        return riskSpecificTextileGarmentSpinning;
    }

    public RiskSpecificTextileGarmentSpinning findByRAForm(int raformsId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RiskSpecificTextileGarmentSpinning  WHERE RAformId = :RAformId");
        query.setParameter("RAformId", raformsId);
        RiskSpecificTextileGarmentSpinning riskSpecificTextileGarmentSpinning = (RiskSpecificTextileGarmentSpinning) query.uniqueResult();
        session.flush();

        return riskSpecificTextileGarmentSpinning;
    }

    public void add(RiskSpecificTextileGarmentSpinning riskSpecificTextileGarmentSpinning) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(riskSpecificTextileGarmentSpinning);
        session.flush();
    }

    public void edit(RiskSpecificTextileGarmentSpinning riskSpecificTextileGarmentSpinning) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(riskSpecificTextileGarmentSpinning);
        session.flush();
    }
}

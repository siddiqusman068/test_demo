package com.ublircs.dao.Impl;

import com.ublircs.dao.RiskSpecificLiveStocksFarmsDao;
import com.ublircs.model.RiskSpecificLiveStocksFarms;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Engr Haider Iqbal on 07/02/2021.
 */
@Repository
@Transactional
public class RiskSpecificLiveStocksFarmsDaoImpl implements RiskSpecificLiveStocksFarmsDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<RiskSpecificLiveStocksFarms> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RiskSpecificLiveStocksFarms");
        List<RiskSpecificLiveStocksFarms> riskSpecificLiveStocksFarmsList = query.list();
        session.flush();

        return riskSpecificLiveStocksFarmsList;
    }

    public RiskSpecificLiveStocksFarms findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        RiskSpecificLiveStocksFarms riskSpecificLiveStocksFarms = (RiskSpecificLiveStocksFarms) session.get(RiskSpecificLiveStocksFarms.class, id);
        session.flush();

        return riskSpecificLiveStocksFarms;
    }

    public RiskSpecificLiveStocksFarms findByRAForm(int raformsId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RiskSpecificLiveStocksFarms  WHERE RAformId = :RAformId");
        query.setParameter("RAformId", raformsId);
        RiskSpecificLiveStocksFarms riskSpecificLiveStocksFarms = (RiskSpecificLiveStocksFarms) query.uniqueResult();
        session.flush();

        return riskSpecificLiveStocksFarms;
    }

    public void add(RiskSpecificLiveStocksFarms riskSpecificLiveStocksFarms) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(riskSpecificLiveStocksFarms);
        session.flush();
    }

    public void edit(RiskSpecificLiveStocksFarms riskSpecificLiveStocksFarms) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(riskSpecificLiveStocksFarms);
        session.flush();
    }
}

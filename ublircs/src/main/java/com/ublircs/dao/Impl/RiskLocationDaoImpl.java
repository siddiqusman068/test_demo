package com.ublircs.dao.Impl;

import com.ublircs.dao.RiskLocationDao;
import com.ublircs.model.RCSLog;
import com.ublircs.model.RiskLocations;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Usman Siddiq on 12/01/2021.
 */
@Repository
@Transactional
public class RiskLocationDaoImpl  implements RiskLocationDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<RiskLocations> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RiskLocations");
        List<RiskLocations> riskLocationsList = query.list();
        session.flush();

        return riskLocationsList;
    }

    public List<RiskLocations> findAllRiskLocationByBranchId(int bid) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RiskLocations WHERE BranchId = :BranchId");
        query.setParameter("BranchId", bid);
        List<RiskLocations> riskLocationsList = query.list();
        session.flush();

        return riskLocationsList;
    }

    public RiskLocations findRiskLocationByRiskCode(String riskCode) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RiskLocations where RiskCode = :RiskCode");
        query.setParameter("RiskCode", riskCode);
        RiskLocations riskLocation = (RiskLocations) query.uniqueResult();
        session.flush();

        return riskLocation;
    }

    public RiskLocations findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        RiskLocations riskLocation = (RiskLocations) session.get(RiskLocations.class, id);
        session.flush();
        return riskLocation;
    }

    public void add(RiskLocations riskLocations) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(riskLocations);
        session.flush();
    }

    public void edit(RiskLocations riskLocations) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(riskLocations);
        session.flush();
    }
}

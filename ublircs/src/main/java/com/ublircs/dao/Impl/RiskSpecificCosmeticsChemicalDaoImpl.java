package com.ublircs.dao.Impl;

import com.ublircs.dao.RiskSpecificCosmeticsChemicalDao;
import com.ublircs.model.RiskSpecificCosmeticsChemical;
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
public class RiskSpecificCosmeticsChemicalDaoImpl implements RiskSpecificCosmeticsChemicalDao{

    @Autowired
    private SessionFactory sessionFactory;


    public List<RiskSpecificCosmeticsChemical> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RiskSpecificCosmeticsChemical");
        List<RiskSpecificCosmeticsChemical> riskSpecificCosmeticsChemicalsList = query.list();
        session.flush();

        return riskSpecificCosmeticsChemicalsList;
    }

    public RiskSpecificCosmeticsChemical findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        RiskSpecificCosmeticsChemical riskSpecificCosmeticsChemical = (RiskSpecificCosmeticsChemical) session.get(RiskSpecificCosmeticsChemical.class, id);
        session.flush();

        return riskSpecificCosmeticsChemical;
    }

    public RiskSpecificCosmeticsChemical findByRAForm(int raformsId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RiskSpecificCosmeticsChemical  WHERE RAformId = :RAformId");
        query.setParameter("RAformId", raformsId);
        RiskSpecificCosmeticsChemical riskSpecificCosmeticsChemical = (RiskSpecificCosmeticsChemical) query.uniqueResult();
        session.flush();

        return riskSpecificCosmeticsChemical;
    }

    public void add(RiskSpecificCosmeticsChemical riskSpecificCosmeticsChemical) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(riskSpecificCosmeticsChemical);
        session.flush();
    }

    public void edit(RiskSpecificCosmeticsChemical riskSpecificCosmeticsChemical) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(riskSpecificCosmeticsChemical);
        session.flush();
    }
}

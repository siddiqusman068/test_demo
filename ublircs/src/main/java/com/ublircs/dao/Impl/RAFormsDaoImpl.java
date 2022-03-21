package com.ublircs.dao.Impl;

import com.ublircs.dao.RAFormsDao;
import com.ublircs.model.RAForms;
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
public class RAFormsDaoImpl implements RAFormsDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<RAForms> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("SELECT * FROM raforms order by raFormId desc").addEntity(RAForms.class);
        List<RAForms> raFormsList = query.list();
        session.flush();

        return raFormsList;
    }

    public List<RAForms> findAllBranchWise(int branchId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RAForms where BranchId = :BranchId");
        query.setParameter("BranchId", branchId);
        List<RAForms> raFormsList = query.list();
        session.flush();

        return raFormsList;
    }

    public List<RAForms> findAllByRanks(String ranks) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RAForms where Ranks = :Ranks");
        query.setParameter("Ranks", ranks);
        List<RAForms> raFormsList = query.list();
        session.flush();

        return raFormsList;
    }

    public List<RAForms> findAllByRanks(String ranks, int branchId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RAForms where Ranks="+"'"+ranks+"'"+" and BranchId="+"'"+branchId+"'");
        List<RAForms> raFormsList = query.list();
        session.flush();
        return raFormsList;
    }

    /*public RAForms findRiskLocationCity(int raformId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("SELECT r.*,rl.city FROM risklocations as rl Inner JOIN raforms as r ON r.RiskLocationId = rl.riskLocationId where r.raFormId :raFormId").addEntity(RAForms.class);
        query.setParameter("raFormId", raformId);
        session.flush();

        return raForms;
    }*/

    public List<RAForms> findAllByRanks(int branchId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RAForms where BranchId = :BranchId");
        query.setParameter("BranchId", branchId);
        List<RAForms> raFormsList = query.list();
        session.flush();

        return raFormsList;
    }

    public List<RAForms> findAllByAssignTo(String userName) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RAForms where AssignedToName = :AssignedToName");
        query.setParameter("AssignedToName", userName);
        List<RAForms> raFormsList = query.list();
        session.flush();

        return raFormsList;
    }

    public RAForms findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        RAForms raForms = (RAForms) session.get(RAForms.class, id);
        session.flush();

        return raForms;
    }

    public RAForms findByRAFormNo(String raformNo) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RAForms where RAFormNo = :RAFormNo");
        query.setParameter("RAFormNo", raformNo);
        RAForms raForms = (RAForms) query.uniqueResult();
        session.flush();

        return raForms;
    }

    public void add(RAForms raForms) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(raForms);
        session.flush();
    }

    public void edit(RAForms raForms) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(raForms);
        session.flush();
    }
}

package com.ublircs.dao.Impl;

import com.ublircs.dao.RiskSpecificPaperBoardDao;
import com.ublircs.model.RiskSpecificPaperBoard;
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
public class RiskSpecificPaperBoardDaoImpl implements RiskSpecificPaperBoardDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<RiskSpecificPaperBoard> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RiskSpecificPaperBoard");
        List<RiskSpecificPaperBoard> riskSpecificPaperBoardList = query.list();
        session.flush();

        return riskSpecificPaperBoardList;
    }

    public RiskSpecificPaperBoard findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        RiskSpecificPaperBoard riskSpecificPaperBoard = (RiskSpecificPaperBoard) session.get(RiskSpecificPaperBoard.class, id);
        session.flush();

        return riskSpecificPaperBoard;
    }

    public RiskSpecificPaperBoard findByRAForm(int raformsId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RiskSpecificPaperBoard  WHERE RAformId = :RAformId");
        query.setParameter("RAformId", raformsId);
        RiskSpecificPaperBoard riskSpecificPaperBoard = (RiskSpecificPaperBoard) query.uniqueResult();
        session.flush();

        return riskSpecificPaperBoard;
    }

    public void add(RiskSpecificPaperBoard riskSpecificPaperBoard) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(riskSpecificPaperBoard);
        session.flush();
    }

    public void edit(RiskSpecificPaperBoard riskSpecificPaperBoard) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(riskSpecificPaperBoard);
        session.flush();
    }
}

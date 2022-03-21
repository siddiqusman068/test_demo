package com.ublircs.dao.Impl;

import com.ublircs.dao.BranchesDao;
import com.ublircs.model.Branches;
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
public class BranchesDaoImpl implements BranchesDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<Branches> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Branches");
        List<Branches> branchesList = query.list();
        session.flush();

        return branchesList;
    }

    public Branches findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Branches branches = (Branches) session.get(Branches.class, id);
        session.flush();

        return branches;
    }

    public void add(Branches branches) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(branches);
        session.flush();
    }

    public void edit(Branches branches) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(branches);
        session.flush();
    }
}

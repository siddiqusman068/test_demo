package com.ublircs.dao.Impl;

import com.ublircs.dao.LocationInspectionPicDao;
import com.ublircs.model.LocationInspectionPics;
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
public class LocationInspectionPicDaoImpl implements LocationInspectionPicDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<LocationInspectionPics> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from LocationInspectionPics");
        List<LocationInspectionPics> locationInspectionPicses = query.list();
        session.flush();

        return locationInspectionPicses;
    }

    public LocationInspectionPics findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        LocationInspectionPics locationInspectionPics = (LocationInspectionPics) session.get(LocationInspectionPics.class, id);
        session.flush();

        return locationInspectionPics;
    }

    public List<LocationInspectionPics> findByRAForms(int raformsId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from LocationInspectionPics WHERE RAFormId = :RAFormId");
        query.setParameter("RAFormId", raformsId);
        List<LocationInspectionPics> locationInspectionPicses = query.list();
        session.flush();

        return locationInspectionPicses;
    }

    public void add(LocationInspectionPics locationInspectionPics) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(locationInspectionPics);
        session.flush();
    }

    public void edit(LocationInspectionPics locationInspectionPics) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(locationInspectionPics);
        session.flush();
    }

    public void delete(LocationInspectionPics locationInspectionPics) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(locationInspectionPics);
        session.flush();
    }
}

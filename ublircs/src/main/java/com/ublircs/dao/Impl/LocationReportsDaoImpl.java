package com.ublircs.dao.Impl;

import com.ublircs.dao.LocationReportsDao;
import com.ublircs.model.LocationReports;
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
public class LocationReportsDaoImpl implements LocationReportsDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<LocationReports> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from LocationReports");
        List<LocationReports> locationReportsList = query.list();
        session.flush();

        return locationReportsList;
    }

    public LocationReports findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        LocationReports locationReports = (LocationReports) session.get(LocationReports.class, id);
        session.flush();

        return locationReports;
    }

    public List<LocationReports> findByRAForms(int raformsId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from LocationReports WHERE RAFormId = :RAFormId");
        query.setParameter("RAFormId", raformsId);
        List<LocationReports> locationReportsList = query.list();
        session.flush();

        return locationReportsList;
    }

    public void add(LocationReports locationReports) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(locationReports);
        session.flush();
    }

    public void edit(LocationReports locationReports) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(locationReports);
        session.flush();
    }

    public void delete(LocationReports locationReports) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(locationReports);
        session.flush();
    }
}

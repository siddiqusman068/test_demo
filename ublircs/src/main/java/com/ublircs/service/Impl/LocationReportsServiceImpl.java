package com.ublircs.service.Impl;

import com.ublircs.dao.LocationReportsDao;
import com.ublircs.model.LocationReports;
import com.ublircs.service.LocationReportsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Service
public class LocationReportsServiceImpl implements LocationReportsService{

    @Autowired
    LocationReportsDao locationReportsDao;


    public List<LocationReports> findAll() {
        return locationReportsDao.findAll();
    }

    public LocationReports findById(int id) {
        return locationReportsDao.findById(id);
    }

    public List<LocationReports> findByRAForms(int raformsId) {
        return locationReportsDao.findByRAForms(raformsId);
    }

    public void add(LocationReports locationReports) {
        locationReportsDao.add(locationReports);
    }

    public void edit(LocationReports locationReports) {
        locationReportsDao.edit(locationReports);
    }

    public void delete(LocationReports LocationReports) {
        locationReportsDao.delete(LocationReports);
    }
}

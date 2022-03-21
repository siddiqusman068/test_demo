package com.ublircs.service.Impl;

import com.ublircs.dao.LocationInspectionPicDao;
import com.ublircs.model.LocationInspectionPics;
import com.ublircs.service.LocationInspectionPicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Service
public class LocationInspectionPicServiceImpl implements LocationInspectionPicService{

    @Autowired
    LocationInspectionPicDao locationInspectionPicDao;

    public List<LocationInspectionPics> findAll() {
        return locationInspectionPicDao.findAll();
    }

    public LocationInspectionPics findById(int id) {
        return locationInspectionPicDao.findById(id);
    }

    public List<LocationInspectionPics> findByRAForms(int raformsId) {
        return locationInspectionPicDao.findByRAForms(raformsId);
    }

    public void add(LocationInspectionPics locationInspectionPics) {
        locationInspectionPicDao.add(locationInspectionPics);
    }

    public void edit(LocationInspectionPics locationInspectionPics) {
        locationInspectionPicDao.edit(locationInspectionPics);
    }

    public void delete(LocationInspectionPics locationInspectionPics) {
        locationInspectionPicDao.delete(locationInspectionPics);
    }
}

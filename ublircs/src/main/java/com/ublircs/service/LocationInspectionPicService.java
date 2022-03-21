package com.ublircs.service;

import com.ublircs.model.LocationInspectionPics;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface LocationInspectionPicService {

    List<LocationInspectionPics> findAll();
    LocationInspectionPics findById(int id);
    List<LocationInspectionPics> findByRAForms(int raformsId);
    void add(LocationInspectionPics locationInspectionPics);
    void edit(LocationInspectionPics locationInspectionPics);
    void delete(LocationInspectionPics locationInspectionPics);

}

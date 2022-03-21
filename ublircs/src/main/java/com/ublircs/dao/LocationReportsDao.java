package com.ublircs.dao;

import com.ublircs.model.LocationReports;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface LocationReportsDao {

    List<LocationReports> findAll();
    LocationReports findById(int id);
    List<LocationReports> findByRAForms(int raformsId);
    void add(LocationReports locationReports);
    void edit(LocationReports locationReports);
    void delete(LocationReports locationReports);

}

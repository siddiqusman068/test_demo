package com.ublircs.dao;

import com.ublircs.model.RAForms;
import com.ublircs.model.RiskLocations;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface RAFormsDao {

    List<RAForms> findAll();
    List<RAForms> findAllBranchWise(int branchId);
    List<RAForms> findAllByRanks(String ranks);
    List<RAForms> findAllByRanks(String ranks,int branchId);
    /*List<RAForms> findRiskLocationCity(int raformId);*/
    List<RAForms> findAllByRanks(int branchId);
    List<RAForms> findAllByAssignTo(String userName);
    RAForms findById (int id);
    RAForms findByRAFormNo (String raformNo);
    void add(RAForms rickSpecificOilFeed);
    void edit(RAForms rickSpecificOilFeed);

}

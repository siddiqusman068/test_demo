package com.ublircs.service;

import com.ublircs.model.RAForms;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface RAFormsService {

    List<RAForms> findAll();
    List<RAForms> findAllBranchWise(int branchId);
    List<RAForms> findAllByRanks(String ranks);
    List<RAForms> findAllByRanks(String ranks,int branchId);
    List<RAForms> findAllByRanks(int branchId);
    List<RAForms> findAllByAssignTo(String userName);
    RAForms findById (int id);
    RAForms findByRAFormNo (String raformNo);
    void add(RAForms raForms);
    void edit(RAForms raForms);

}

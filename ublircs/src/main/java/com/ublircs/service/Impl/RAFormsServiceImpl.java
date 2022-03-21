package com.ublircs.service.Impl;

import com.ublircs.dao.RAFormsDao;
import com.ublircs.model.RAForms;
import com.ublircs.service.RAFormsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Service
public class RAFormsServiceImpl implements RAFormsService{

    @Autowired
    RAFormsDao raFormsDao;


    public List<RAForms> findAll() {
        return raFormsDao.findAll();
    }

    public List<RAForms> findAllBranchWise(int branchId) {
        return raFormsDao.findAllBranchWise(branchId);
    }

    public List<RAForms> findAllByRanks(String ranks) {
        return raFormsDao.findAllByRanks(ranks);
    }

    public List<RAForms> findAllByRanks(String ranks, int branchId) {
        return raFormsDao.findAllByRanks(ranks, branchId);
    }

    public List<RAForms> findAllByRanks(int branchId) {
        return raFormsDao.findAllByRanks(branchId);
    }

    public List<RAForms> findAllByAssignTo(String userName) {
        return raFormsDao.findAllByAssignTo(userName);
    }

    public RAForms findById(int id) {
        return raFormsDao.findById(id);
    }

    public RAForms findByRAFormNo(String raformNo) {
        return raFormsDao.findByRAFormNo(raformNo);
    }

    public void add(RAForms raForms) {
        raFormsDao.add(raForms);
    }

    public void edit(RAForms raForms) {
        raFormsDao.edit(raForms);
    }
}

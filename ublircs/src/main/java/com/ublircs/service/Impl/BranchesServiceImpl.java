package com.ublircs.service.Impl;

import com.ublircs.dao.BranchesDao;
import com.ublircs.model.Branches;
import com.ublircs.service.BranchesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Service
public class BranchesServiceImpl implements BranchesService{

    @Autowired
    BranchesDao branchesDao;


    public List<Branches> findAll() {
        return branchesDao.findAll();
    }

    public Branches findById(int id) {
        return branchesDao.findById(id);
    }

    public void add(Branches branches) {
        branchesDao.add(branches);
    }

    public void edit(Branches branches) {
        branchesDao.edit(branches);
    }
}

package com.ublircs.dao;

import com.ublircs.model.Branches;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface BranchesDao {

    List<Branches> findAll();
    Branches findById(int id);
    void add(Branches branches);
    void edit(Branches branches);

}

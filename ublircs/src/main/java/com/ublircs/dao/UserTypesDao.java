package com.ublircs.dao;

import com.ublircs.model.UserTypes;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface UserTypesDao {

    List<UserTypes> findAll();
    UserTypes findById(int id);
    List<UserTypes> findSpecific();
}

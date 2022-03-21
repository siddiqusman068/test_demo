package com.ublircs.service.Impl;

import com.ublircs.dao.UserTypesDao;
import com.ublircs.model.UserTypes;
import com.ublircs.service.UserTypesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Service
public class UserTypesServiceImpl implements UserTypesService{

    @Autowired
    UserTypesDao userTypesDao;


    public List<UserTypes> findAll() {
        return userTypesDao.findAll();
    }

    public UserTypes findById(int id) {
        return userTypesDao.findById(id);
    }

    public List<UserTypes> findSpecific() {
        return userTypesDao.findSpecific();
    }
}

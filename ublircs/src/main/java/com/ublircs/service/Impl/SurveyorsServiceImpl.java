package com.ublircs.service.Impl;

import com.ublircs.dao.SurveyorsDao;
import com.ublircs.model.Surveyors;
import com.ublircs.service.SurveyorsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Service
public class SurveyorsServiceImpl implements SurveyorsService{

    @Autowired
    SurveyorsDao surveyorsDao;

    public List<Surveyors> findAll() {
        return surveyorsDao.findAll();
    }

    public Surveyors findById(int id) {
        return surveyorsDao.findById(id);
    }

    public Surveyors findByUserName(String userName) {
        return surveyorsDao.findByUserName(userName);
    }

    public Surveyors findUserByEmail(String email) {
        return surveyorsDao.findUserByEmail(email);
    }

    public Surveyors findUserByCode(String code) {
        return surveyorsDao.findUserByCode(code);
    }

    public void add(Surveyors surveyors) {
        surveyorsDao.add(surveyors);
    }

    public void edit(Surveyors surveyors) {
        surveyorsDao.edit(surveyors);
    }
}

package com.ublircs.service;

import com.ublircs.model.Surveyors;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface SurveyorsService {

    List<Surveyors> findAll();
    Surveyors findById (int id);
    Surveyors findByUserName (String userName);
    Surveyors findUserByEmail(String email);
    Surveyors findUserByCode(String code);
    void add(Surveyors surveyors);
    void edit(Surveyors surveyors);

}

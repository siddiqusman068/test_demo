package com.ublircs.service;

import com.ublircs.model.RCSLog;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface RCSLogService {

    List<RCSLog> findAll();
    List<RCSLog> findAllLogsByRAFormId(int id);
    RCSLog findById(int id);
    void add(RCSLog rcsLog);

}

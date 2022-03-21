package com.ublircs.service.Impl;

import com.ublircs.dao.RCSLogDao;
import com.ublircs.model.RCSLog;
import com.ublircs.service.RCSLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Service
public class RCSLogServiceImpl implements RCSLogService{

    @Autowired
    RCSLogDao rcsLogDao;


    public List<RCSLog> findAll() {
        return rcsLogDao.findAll();
    }

    public List<RCSLog> findAllLogsByRAFormId(int id) {
        return rcsLogDao.findAllLogsByRAFormId(id);
    }

    public RCSLog findById(int id) {
        return rcsLogDao.findById(id);
    }

    public void add(RCSLog rcsLog) {
        rcsLogDao.add(rcsLog);
    }
}

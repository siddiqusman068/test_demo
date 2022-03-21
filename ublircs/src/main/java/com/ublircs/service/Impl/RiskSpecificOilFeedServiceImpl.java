package com.ublircs.service.Impl;

import com.ublircs.dao.RiskSpecificOilFeedDao;
import com.ublircs.model.RiskSpecificOilFeed;
import com.ublircs.service.RiskSpecificOilFeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Service
public class RiskSpecificOilFeedServiceImpl implements RiskSpecificOilFeedService {

    @Autowired
    RiskSpecificOilFeedDao  riskSpecificOilFeedDao;

    public List<RiskSpecificOilFeed> findAll() {
        return riskSpecificOilFeedDao.findAll();
    }

    public RiskSpecificOilFeed findById(int id) {
        return riskSpecificOilFeedDao.findById(id);
    }

    public RiskSpecificOilFeed findByRAForm(int RAformId) {
        return riskSpecificOilFeedDao.findByRAForm(RAformId);
    }

    public void add(RiskSpecificOilFeed riskSpecificOilFeed) {
            riskSpecificOilFeedDao.add(riskSpecificOilFeed);
    }

    public void edit(RiskSpecificOilFeed riskSpecificOilFeed) {
            riskSpecificOilFeedDao.edit(riskSpecificOilFeed);
    }
}




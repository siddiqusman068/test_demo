package com.ublircs.service.Impl;

import com.ublircs.dao.RiskLocationDao;
import com.ublircs.model.RiskLocations;
import com.ublircs.service.RiskLocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Usman Siddiq on 12/01/2021.
 */
@Service
public class RiskLocationServiceImpl implements RiskLocationService{

    @Autowired
    RiskLocationDao riskLocationDao;

    public List<RiskLocations> findAll() {
        return riskLocationDao.findAll();
    }

    public List<RiskLocations> findAllRiskLocationByBranchId(int bid) {
        return riskLocationDao.findAllRiskLocationByBranchId(bid);
    }

    public RiskLocations findRiskLocationByRiskCode(String riskCode) {
        return riskLocationDao.findRiskLocationByRiskCode(riskCode);
    }

    public RiskLocations findById(int id) {
        return riskLocationDao.findById(id);
    }

    public void add(RiskLocations riskLocations) {
        riskLocationDao.add(riskLocations);
    }

    public void edit(RiskLocations riskLocations) {
        riskLocationDao.edit(riskLocations);
    }
}

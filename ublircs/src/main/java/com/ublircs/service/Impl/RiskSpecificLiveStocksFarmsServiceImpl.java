package com.ublircs.service.Impl;

import com.ublircs.dao.RiskSpecificLiveStocksFarmsDao;
import com.ublircs.model.RiskSpecificLiveStocksFarms;
import com.ublircs.service.RiskSpecificLiveStocksFarmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Engr Haider Iqbal on 07/02/2021.
 */
@Service
public class RiskSpecificLiveStocksFarmsServiceImpl implements RiskSpecificLiveStocksFarmsService {

    @Autowired
    RiskSpecificLiveStocksFarmsDao riskSpecificLiveStocksFarmsDao;

    public List<RiskSpecificLiveStocksFarms> findAll() {
        return riskSpecificLiveStocksFarmsDao.findAll();
    }

    public RiskSpecificLiveStocksFarms findById(int id) {
        return riskSpecificLiveStocksFarmsDao.findById(id);
    }

    public RiskSpecificLiveStocksFarms findByRAForm(int RAformId) {
        return riskSpecificLiveStocksFarmsDao.findByRAForm(RAformId);
    }

    public void add(RiskSpecificLiveStocksFarms riskSpecificLiveStocksFarms) {
        riskSpecificLiveStocksFarmsDao.add(riskSpecificLiveStocksFarms);
    }

    public void edit(RiskSpecificLiveStocksFarms riskSpecificLiveStocksFarms) {
        riskSpecificLiveStocksFarmsDao.edit(riskSpecificLiveStocksFarms);
    }
}

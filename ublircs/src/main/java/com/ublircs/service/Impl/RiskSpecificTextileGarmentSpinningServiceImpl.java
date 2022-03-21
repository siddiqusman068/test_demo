package com.ublircs.service.Impl;

import com.ublircs.dao.RiskSpecificTextileGarmentSpinningDao;
import com.ublircs.model.RiskSpecificTextileGarmentSpinning;
import com.ublircs.service.RiskSpecificTextileGarmentSpinningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Service
public class RiskSpecificTextileGarmentSpinningServiceImpl implements RiskSpecificTextileGarmentSpinningService{

    @Autowired
    RiskSpecificTextileGarmentSpinningDao riskSpecificTextileGarmentSpinningDao;

    public List<RiskSpecificTextileGarmentSpinning> findAll() {
        return riskSpecificTextileGarmentSpinningDao.findAll();
    }

    public RiskSpecificTextileGarmentSpinning findById(int id) {
        return riskSpecificTextileGarmentSpinningDao.findById(id);
    }

    public RiskSpecificTextileGarmentSpinning findByRAForm(int RAformId) {
        return riskSpecificTextileGarmentSpinningDao.findByRAForm(RAformId);
    }

    public void add(RiskSpecificTextileGarmentSpinning riskSpecificTextileGarmentSpinning) {
            riskSpecificTextileGarmentSpinningDao.add(riskSpecificTextileGarmentSpinning);
    }

    public void edit(RiskSpecificTextileGarmentSpinning riskSpecificTextileGarmentSpinning) {
            riskSpecificTextileGarmentSpinningDao.edit(riskSpecificTextileGarmentSpinning);
    }
}

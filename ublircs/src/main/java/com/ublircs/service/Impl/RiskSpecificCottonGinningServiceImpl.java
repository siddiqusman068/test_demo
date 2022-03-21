package com.ublircs.service.Impl;

import com.ublircs.dao.RiskSpecificCottonGinningDao;
import com.ublircs.model.RiskSpecificCottonGinning;
import com.ublircs.service.RiskSpecificCottonGinningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Service
public class RiskSpecificCottonGinningServiceImpl implements RiskSpecificCottonGinningService {


    @Autowired
    RiskSpecificCottonGinningDao riskSpecificCottonGinningDao;

    public List<RiskSpecificCottonGinning> findAll() {
        return riskSpecificCottonGinningDao.findAll();
    }

    public RiskSpecificCottonGinning findById(int id) {
        return riskSpecificCottonGinningDao.findById(id);
    }

    public RiskSpecificCottonGinning findByRAForm(int RAformId) {
        return riskSpecificCottonGinningDao.findByRAForm(RAformId);
    }

    public void add(RiskSpecificCottonGinning riskSpecificCottonGinning) {
        riskSpecificCottonGinningDao.add(riskSpecificCottonGinning);
    }

    public void edit(RiskSpecificCottonGinning riskSpecificCottonGinning) {
        riskSpecificCottonGinningDao.edit(riskSpecificCottonGinning);
    }





}

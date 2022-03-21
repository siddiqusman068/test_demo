package com.ublircs.service.Impl;

import com.ublircs.dao.RiskSpecificCosmeticsChemicalDao;
import com.ublircs.model.RiskSpecificCosmeticsChemical;
import com.ublircs.service.RiskSpecificCosmeticsChemicalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Service
public class RiskSpecificCosmeticsChemicalServiceImpl implements RiskSpecificCosmeticsChemicalService{

    @Autowired
    RiskSpecificCosmeticsChemicalDao riskSpecificCosmeticsChemicalDao;


    public List<RiskSpecificCosmeticsChemical> findAll() {
        return riskSpecificCosmeticsChemicalDao.findAll();
    }

    public RiskSpecificCosmeticsChemical findById(int id) {
        return riskSpecificCosmeticsChemicalDao.findById(id);
    }

    public RiskSpecificCosmeticsChemical findByRAForm(int RAformId) {
        return riskSpecificCosmeticsChemicalDao.findByRAForm(RAformId);
    }

    public void add(RiskSpecificCosmeticsChemical rickSpecificOilFeed) {
        riskSpecificCosmeticsChemicalDao.add(rickSpecificOilFeed);
    }

    public void edit(RiskSpecificCosmeticsChemical rickSpecificOilFeed) {

    }
}

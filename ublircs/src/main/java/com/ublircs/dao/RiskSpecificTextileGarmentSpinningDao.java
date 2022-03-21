package com.ublircs.dao;

import com.ublircs.model.RiskSpecificTextileGarmentSpinning;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface RiskSpecificTextileGarmentSpinningDao {

    List<RiskSpecificTextileGarmentSpinning> findAll();
    RiskSpecificTextileGarmentSpinning findById (int id);
    RiskSpecificTextileGarmentSpinning findByRAForm (int RAformId);
    void add(RiskSpecificTextileGarmentSpinning riskSpecificTextileGarmentSpinning);
    void edit(RiskSpecificTextileGarmentSpinning riskSpecificTextileGarmentSpinning);

}

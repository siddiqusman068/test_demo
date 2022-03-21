package com.ublircs.service;

import com.ublircs.model.RiskSpecificLiveStocksFarms;

import java.util.List;

/**
 * Created by Engr Haider Iqbal on 07/02/2021.
 */
public interface RiskSpecificLiveStocksFarmsService {
    List<RiskSpecificLiveStocksFarms> findAll();
    RiskSpecificLiveStocksFarms findById (int id);
    RiskSpecificLiveStocksFarms findByRAForm (int RAformId);
    void add(RiskSpecificLiveStocksFarms riskSpecificLiveStocksFarms);
    void edit(RiskSpecificLiveStocksFarms riskSpecificLiveStocksFarms);
}

package com.ublircs.service;

import com.ublircs.model.RiskLocations;

import java.util.List;

/**
 * Created by Usman Siddiq on 12/01/2021.
 */
public interface RiskLocationService {

    List<RiskLocations> findAll();
    List<RiskLocations> findAllRiskLocationByBranchId(int bid);
    RiskLocations findRiskLocationByRiskCode(String riskCode);
    RiskLocations findById(int id);
    void add(RiskLocations riskLocations);
    void edit(RiskLocations riskLocations);
}

package com.ublircs.service;

import com.ublircs.model.RiskSpecificOilFeed;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface RiskSpecificOilFeedService {

    List<RiskSpecificOilFeed> findAll();
    RiskSpecificOilFeed findById (int id);
    RiskSpecificOilFeed findByRAForm (int RAformId);
    void add(RiskSpecificOilFeed riskSpecificOilFeed);
    void edit(RiskSpecificOilFeed riskSpecificOilFeed);

}

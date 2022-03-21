package com.ublircs.dao;

import com.ublircs.model.RiskSpecificOilFeed;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface RiskSpecificOilFeedDao {

    List<RiskSpecificOilFeed> findAll();
    RiskSpecificOilFeed findById (int id);
    RiskSpecificOilFeed findByRAForm (int raformsId);
    void add(RiskSpecificOilFeed rickSpecificOilFeed);
    void edit(RiskSpecificOilFeed rickSpecificOilFeed);
}

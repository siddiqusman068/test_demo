package com.ublircs.dao;

import com.ublircs.model.RiskSpecificCottonGinning;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface RiskSpecificCottonGinningDao {

    List<RiskSpecificCottonGinning> findAll();
    RiskSpecificCottonGinning findById (int id);
    RiskSpecificCottonGinning findByRAForm (int raformsId);
    void add(RiskSpecificCottonGinning riskSpecificCottonGinning);
    void edit(RiskSpecificCottonGinning riskSpecificCottonGinning);

}

package com.ublircs.service;

import com.ublircs.model.RiskSpecificCottonGinning;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface RiskSpecificCottonGinningService {

    List<RiskSpecificCottonGinning> findAll();
    RiskSpecificCottonGinning findById (int id);
    RiskSpecificCottonGinning findByRAForm (int RAformId);
    void add(RiskSpecificCottonGinning riskSpecificCottonGinning);
    void edit(RiskSpecificCottonGinning riskSpecificCottonGinning);


}

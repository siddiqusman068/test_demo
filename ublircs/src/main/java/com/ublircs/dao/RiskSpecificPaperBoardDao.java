package com.ublircs.dao;

import com.ublircs.model.RiskSpecificPaperBoard;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface RiskSpecificPaperBoardDao {

    List<RiskSpecificPaperBoard> findAll();
    RiskSpecificPaperBoard findById (int id);
    RiskSpecificPaperBoard findByRAForm (int RAformId);
    void add(RiskSpecificPaperBoard riskSpecificPaperBoard);
    void edit(RiskSpecificPaperBoard riskSpecificPaperBoard);

}

package com.ublircs.service;

import com.ublircs.model.RiskSpecificCosmeticsChemical;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface RiskSpecificCosmeticsChemicalService {

    List<RiskSpecificCosmeticsChemical> findAll();
    RiskSpecificCosmeticsChemical findById (int id);
    RiskSpecificCosmeticsChemical findByRAForm (int RAformId);
    void add(RiskSpecificCosmeticsChemical riskSpecificCosmeticsChemical);
    void edit(RiskSpecificCosmeticsChemical riskSpecificCosmeticsChemical);

}

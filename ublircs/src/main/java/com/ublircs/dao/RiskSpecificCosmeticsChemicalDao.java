package com.ublircs.dao;

import com.ublircs.model.RiskSpecificCosmeticsChemical;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface RiskSpecificCosmeticsChemicalDao {

    List<RiskSpecificCosmeticsChemical> findAll();
    RiskSpecificCosmeticsChemical findById (int id);
    RiskSpecificCosmeticsChemical findByRAForm (int raformsId);
    void add(RiskSpecificCosmeticsChemical riskSpecificCosmeticsChemical);
    void edit(RiskSpecificCosmeticsChemical riskSpecificCosmeticsChemical);

}

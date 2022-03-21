package com.ublircs.service.Impl;

import com.ublircs.dao.RiskSpecificPaperBoardDao;
import com.ublircs.model.RiskSpecificPaperBoard;
import com.ublircs.service.RiskSpecificPaperBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Service
public class RiskSpecificPaperBoardServiceImpl implements RiskSpecificPaperBoardService{

    @Autowired
    RiskSpecificPaperBoardDao riskSpecificPaperBoardDao;

    public List<RiskSpecificPaperBoard> findAll() {
        return riskSpecificPaperBoardDao.findAll();
    }

    public RiskSpecificPaperBoard findById(int id) {
        return riskSpecificPaperBoardDao.findById(id);
    }

    public RiskSpecificPaperBoard findByRAForm(int RAformId) {
        return riskSpecificPaperBoardDao.findByRAForm(RAformId);
    }

    public void add(RiskSpecificPaperBoard riskSpecificPaperBoard) {
        riskSpecificPaperBoardDao.add(riskSpecificPaperBoard);
    }

    public void edit(RiskSpecificPaperBoard riskSpecificPaperBoard) {
        riskSpecificPaperBoardDao.edit(riskSpecificPaperBoard);
    }
}

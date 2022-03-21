package com.ublircs.model;

import javax.persistence.*;

/**
 * Created by apple on 29/11/2020.
 */
@Entity
@Table(name = "RiskSpecificPaperBoard")
public class RiskSpecificPaperBoard {

    private static final long serialVersionUID = -3536677236419382983L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int paperBoardId;

    @Column(name="FourInchesHeight")
    private String fourInchesHeight;

    @Column(name="FourInchesAway")
    private String fourInchesAway;

    @Column(name="StoredOpen")
    private String storedopen;

    @Column(name="StocksThreeFeetBelowCeiling")
    private String stocksThreeFeetBelowCeiling;

    @Column(name="Godownselectrified")
    private String godownselectrified;

    @OneToOne
    @JoinColumn(name = "RAFormId")
    private RAForms raForm;

    public int getPaperBoardId() {
        return paperBoardId;
    }

    public void setPaperBoardId(int paperBoardId) {
        this.paperBoardId = paperBoardId;
    }

    public String getFourInchesHeight() {
        return fourInchesHeight;
    }

    public void setFourInchesHeight(String fourInchesHeight) {
        this.fourInchesHeight = fourInchesHeight;
    }

    public String getFourInchesAway() {
        return fourInchesAway;
    }

    public void setFourInchesAway(String fourInchesAway) {
        this.fourInchesAway = fourInchesAway;
    }

    public String getStoredopen() {
        return storedopen;
    }

    public void setStoredopen(String storedopen) {
        this.storedopen = storedopen;
    }

    public String getStocksThreeFeetBelowCeiling() {
        return stocksThreeFeetBelowCeiling;
    }

    public void setStocksThreeFeetBelowCeiling(String stocksThreeFeetBelowCeiling) {
        this.stocksThreeFeetBelowCeiling = stocksThreeFeetBelowCeiling;
    }

    public String getGodownselectrified() {
        return godownselectrified;
    }

    public void setGodownselectrified(String godownselectrified) {
        this.godownselectrified = godownselectrified;
    }

    public RAForms getRaForm() {
        return raForm;
    }

    public void setRaForm(RAForms raForm) {
        this.raForm = raForm;
    }
}

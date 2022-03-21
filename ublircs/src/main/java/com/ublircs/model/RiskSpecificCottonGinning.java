package com.ublircs.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by apple on 29/11/2020.
 */
@Entity
@Table(name = "RiskSpecificCottonGinning")
public class RiskSpecificCottonGinning implements Serializable {

    private static final long serialVersionUID = -3536677236419382983L;


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int cottonGinningId;

    @Column(name="Stack50feetstored")
    private String stack50feetstored;

    @Column(name="Cottonphuttistacked")
    private String cottonphuttistacked;

    @Column(name="FPIB2500cottonbalesstrored")
    private String fPIB2500cottonbalesstrored;

    @Column(name="FPIB1000cottonbalesstored")
    private String fPIB1000cottonbalesstored;

    @Column(name="Maximumheight6bales")
    private String maximumheight6bales;

    @Column(name="Stackdistance15feet")
    private String stackdistance15feet;

    @Column(name="Lotsofbaledistance75feet")
    private String lotsofbaledistance75feet;

    @Column(name="Cottonbalesdistance30feet")
    private String cottonbalesdistance30feet;

    @Column(name="FPIB10000cottonbalesstoredlocation")
    private String fPIB10000cottonbalesstoredlocation;

    @Column(name="Fuelstockstored50feet")
    private String fuelstockstored50feet;

    @OneToOne
    @JoinColumn(name = "RAFormId")
    private RAForms raForm;

    public int getCottonGinningId() {
        return cottonGinningId;
    }

    public void setCottonGinningId(int cottonGinningId) {
        this.cottonGinningId = cottonGinningId;
    }

    public String getStack50feetstored() {
        return stack50feetstored;
    }

    public void setStack50feetstored(String stack50feetstored) {
        this.stack50feetstored = stack50feetstored;
    }

    public String getCottonphuttistacked() {
        return cottonphuttistacked;
    }

    public void setCottonphuttistacked(String cottonphuttistacked) {
        this.cottonphuttistacked = cottonphuttistacked;
    }

    public String getfPIB2500cottonbalesstrored() {
        return fPIB2500cottonbalesstrored;
    }

    public void setfPIB2500cottonbalesstrored(String fPIB2500cottonbalesstrored) {
        this.fPIB2500cottonbalesstrored = fPIB2500cottonbalesstrored;
    }

    public String getfPIB1000cottonbalesstored() {
        return fPIB1000cottonbalesstored;
    }

    public void setfPIB1000cottonbalesstored(String fPIB1000cottonbalesstored) {
        this.fPIB1000cottonbalesstored = fPIB1000cottonbalesstored;
    }

    public String getMaximumheight6bales() {
        return maximumheight6bales;
    }

    public void setMaximumheight6bales(String maximumheight6bales) {
        this.maximumheight6bales = maximumheight6bales;
    }

    public String getStackdistance15feet() {
        return stackdistance15feet;
    }

    public void setStackdistance15feet(String stackdistance15feet) {
        this.stackdistance15feet = stackdistance15feet;
    }

    public String getLotsofbaledistance75feet() {
        return lotsofbaledistance75feet;
    }

    public void setLotsofbaledistance75feet(String lotsofbaledistance75feet) {
        this.lotsofbaledistance75feet = lotsofbaledistance75feet;
    }

    public String getCottonbalesdistance30feet() {
        return cottonbalesdistance30feet;
    }

    public void setCottonbalesdistance30feet(String cottonbalesdistance30feet) {
        this.cottonbalesdistance30feet = cottonbalesdistance30feet;
    }

    public String getfPIB10000cottonbalesstoredlocation() {
        return fPIB10000cottonbalesstoredlocation;
    }

    public void setfPIB10000cottonbalesstoredlocation(String fPIB10000cottonbalesstoredlocation) {
        this.fPIB10000cottonbalesstoredlocation = fPIB10000cottonbalesstoredlocation;
    }

    public String getFuelstockstored50feet() {
        return fuelstockstored50feet;
    }

    public void setFuelstockstored50feet(String fuelstockstored50feet) {
        this.fuelstockstored50feet = fuelstockstored50feet;
    }

    public RAForms getRaForm() {
        return raForm;
    }

    public void setRaForm(RAForms raForm) {
        this.raForm = raForm;
    }
}

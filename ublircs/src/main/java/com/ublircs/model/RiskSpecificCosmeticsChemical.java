package com.ublircs.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by apple on 29/11/2020.
 */
@Entity
@Table(name = "RiskSpecificCosmeticsChemical")
public class RiskSpecificCosmeticsChemical implements Serializable{

    private static final long serialVersionUID = -3536677236419382983L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int cosmeticsChemicalId;

    @Column(name="Hazardouschemicalstored")
    private String hazardouschemicalstored;

    @Column(name="Chemicalseparatestored")
    private String chemicalseparatestored;

    @Column(name="Chemicalseparatestored30feet")
    private String chemicalseparatestored30feet;

    @Column(name="Rawmaterialquantity")
    private String rawmaterialquantity;

    @Column(name="Rireextinguishersprovided")
    private String fireextinguishersprovided;

    @OneToOne
    @JoinColumn(name = "RAFormId")
    private RAForms raForm;

    public RAForms getRaForm() {
        return raForm;
    }

    public void setRaForm(RAForms raForm) {
        this.raForm = raForm;
    }

    public int getCosmeticsChemicalId() {
        return cosmeticsChemicalId;
    }

    public void setCosmeticsChemicalId(int cosmeticsChemicalId) {
        this.cosmeticsChemicalId = cosmeticsChemicalId;
    }

    public String getHazardouschemicalstored() {
        return hazardouschemicalstored;
    }

    public void setHazardouschemicalstored(String hazardouschemicalstored) {
        this.hazardouschemicalstored = hazardouschemicalstored;
    }

    public String getChemicalseparatestored() {
        return chemicalseparatestored;
    }

    public void setChemicalseparatestored(String chemicalseparatestored) {
        this.chemicalseparatestored = chemicalseparatestored;
    }

    public String getChemicalseparatestored30feet() {
        return chemicalseparatestored30feet;
    }

    public void setChemicalseparatestored30feet(String chemicalseparatestored30feet) {
        this.chemicalseparatestored30feet = chemicalseparatestored30feet;
    }

    public String getRawmaterialquantity() {
        return rawmaterialquantity;
    }

    public void setRawmaterialquantity(String rawmaterialquantity) {
        this.rawmaterialquantity = rawmaterialquantity;
    }

    public String getFireextinguishersprovided() {
        return fireextinguishersprovided;
    }

    public void setFireextinguishersprovided(String fireextinguishersprovided) {
        this.fireextinguishersprovided = fireextinguishersprovided;
    }
}

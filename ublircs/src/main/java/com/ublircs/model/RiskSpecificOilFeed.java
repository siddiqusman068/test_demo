package com.ublircs.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by apple on 29/11/2020.
 */
@Entity
@Table(name = "RiskSpecificOilFeed")
public class RiskSpecificOilFeed implements Serializable {

    private static final long serialVersionUID = -3536677236499382983L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int oilFeedId;

    @Column(name="Combustioncovered")
    private String combustioncovered;

    @Column(name="Combustionsuminsuredpercent")
    private String combustionsuminsuredpercent;

    @Column(name="Noofsilosatfactory")
    private String noofsilosatfactory;

    @Column(name="Seedstored")
    private String seedstored;

    @Column(name="Distancestocks4feet")
    private String distancestocks4feet;

    @Column(name="Firelanesmarked")
    private String firelanesmarked;

    @Column(name="Stackheight15feet")
    private String stackheight15feet;

    @Column(name="Bagsstacked8000")
    private String bagsstacked8000;

    @Column(name="Godownsventilated")
    private String godownsventilated;

    @OneToOne
    @JoinColumn(name = "RAFormId")
    private RAForms raForm;

    public int getOilFeedId() {
        return oilFeedId;
    }

    public void setOilFeedId(int oilFeedId) {
        this.oilFeedId = oilFeedId;
    }

    public String getCombustioncovered() {
        return combustioncovered;
    }

    public void setCombustioncovered(String combustioncovered) {
        this.combustioncovered = combustioncovered;
    }

    public String getCombustionsuminsuredpercent() {
        return combustionsuminsuredpercent;
    }

    public void setCombustionsuminsuredpercent(String combustionsuminsuredpercent) {
        this.combustionsuminsuredpercent = combustionsuminsuredpercent;
    }

    public String getNoofsilosatfactory() {
        return noofsilosatfactory;
    }

    public void setNoofsilosatfactory(String noofsilosatfactory) {
        this.noofsilosatfactory = noofsilosatfactory;
    }

    public String getSeedstored() {
        return seedstored;
    }

    public void setSeedstored(String seedstored) {
        this.seedstored = seedstored;
    }

    public String getDistancestocks4feet() {
        return distancestocks4feet;
    }

    public void setDistancestocks4feet(String distancestocks4feet) {
        this.distancestocks4feet = distancestocks4feet;
    }

    public String getFirelanesmarked() {
        return firelanesmarked;
    }

    public void setFirelanesmarked(String firelanesmarked) {
        this.firelanesmarked = firelanesmarked;
    }

    public String getStackheight15feet() {
        return stackheight15feet;
    }

    public void setStackheight15feet(String stackheight15feet) {
        this.stackheight15feet = stackheight15feet;
    }

    public String getBagsstacked8000() {
        return bagsstacked8000;
    }

    public void setBagsstacked8000(String bagsstacked8000) {
        this.bagsstacked8000 = bagsstacked8000;
    }

    public String getGodownsventilated() {
        return godownsventilated;
    }

    public void setGodownsventilated(String godownsventilated) {
        this.godownsventilated = godownsventilated;
    }

    public RAForms getRaForm() {
        return raForm;
    }

    public void setRaForm(RAForms raForm) {
        this.raForm = raForm;
    }
}

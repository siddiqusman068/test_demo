package com.ublircs.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Usman Siddiq on 27/11/2020.
 */
@Entity
@Table(name = "RiskSpecificTextileGarmentSpinning")
public class RiskSpecificTextileGarmentSpinning implements Serializable{

    private static final long serialVersionUID = -3536677236419382983L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int textileGarmentSpinningId;

    @Column(name="PartitioningWalls")
    private String partitioningWalls;

    @Column(name="FireproofdoorsInstalled")
    private String fireproofdoorsInstalled;

    @Column(name="Stored30feetaway")
    private String stored30feetaway;

    @Column(name="Storedstockproductionarea")
    private String storedstockproductionarea;

    @Column(name="Godownswarehouseselectrified")
    private String godownswarehouseselectrified;

    @Column(name="Separateblowrooms")
    private String separateblowrooms;

    @Column(name="Cottondustcollection")
    private String cottondustcollection;

    @Column(name="Stock50feetstored")
    private String stock50feetstored;

    @Column(name="Installedspinningmills")
    private String installedspinningmills;

    @OneToOne
    @JoinColumn(name = "RAFormId")
    private RAForms raForm;

    public int getTextileGarmentSpinningId() {
        return textileGarmentSpinningId;
    }

    public void setTextileGarmentSpinningId(int textileGarmentSpinningId) {
        this.textileGarmentSpinningId = textileGarmentSpinningId;
    }

    public String getPartitioningWalls() {
        return partitioningWalls;
    }

    public void setPartitioningWalls(String partitioningWalls) {
        this.partitioningWalls = partitioningWalls;
    }

    public String getFireproofdoorsInstalled() {
        return fireproofdoorsInstalled;
    }

    public void setFireproofdoorsInstalled(String fireproofdoorsInstalled) {
        this.fireproofdoorsInstalled = fireproofdoorsInstalled;
    }

    public String getStored30feetaway() {
        return stored30feetaway;
    }

    public void setStored30feetaway(String stored30feetaway) {
        this.stored30feetaway = stored30feetaway;
    }

    public String getStoredstockproductionarea() {
        return storedstockproductionarea;
    }

    public void setStoredstockproductionarea(String storedstockproductionarea) {
        this.storedstockproductionarea = storedstockproductionarea;
    }

    public String getGodownswarehouseselectrified() {
        return godownswarehouseselectrified;
    }

    public void setGodownswarehouseselectrified(String godownswarehouseselectrified) {
        this.godownswarehouseselectrified = godownswarehouseselectrified;
    }

    public String getSeparateblowrooms() {
        return separateblowrooms;
    }

    public void setSeparateblowrooms(String separateblowrooms) {
        this.separateblowrooms = separateblowrooms;
    }

    public String getCottondustcollection() {
        return cottondustcollection;
    }

    public void setCottondustcollection(String cottondustcollection) {
        this.cottondustcollection = cottondustcollection;
    }

    public String getStock50feetstored() {
        return stock50feetstored;
    }

    public void setStock50feetstored(String stock50feetstored) {
        this.stock50feetstored = stock50feetstored;
    }

    public String getInstalledspinningmills() {
        return installedspinningmills;
    }

    public void setInstalledspinningmills(String installedspinningmills) {
        this.installedspinningmills = installedspinningmills;
    }

    public RAForms getRaForm() {
        return raForm;
    }

    public void setRaForm(RAForms raForm) {
        this.raForm = raForm;
    }
}

package com.ublircs.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Engr Haider Iqbal on 07/02/2021.
 */
@Entity
@Table(name = "RiskSpecificLiveStocksFarms")
public class RiskSpecificLiveStocksFarms implements Serializable{

    private static final long serialVersionUID = -3536677236419382983L;


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int liveStockFarmId;

    @Column(name="AnimalsVaccinated")
    private String animalsvaccinated;

    @Column(name="PestSprayCarriedOut")
    private String pestSprayCarriedOut;

    @Column(name="InsuredVeterinaryDoctor")
    private String insuredVeterinaryDoctor;

    @Column(name="InHouseMedicalEmergency")
    private String inhouseMedicalEmergency;

    @Column(name="AnimalsTagged")
    private String animalsTagged;

    @Column(name="DistanceBetweenAnimals")
    private String distanceBetweenAnimals;

    @Column(name="AnimalsEmergencyEvacuationMap")
    private String animalsEmergencyEvacuationMap;

    @Column(name="UnauthorizedEntryInFarm")
    private String unauthorizedEntryInFarm;

    @Column(name="WasteManagementFacility")
    private String wasteManagementFacility;

    @Column(name="SevereWeatherResistSheds")
    private String severeWeatherResistSheds;

    @OneToOne
    @JoinColumn(name = "RAFormId")
    private RAForms raForm;

    public int getLiveStockFarmId() {
        return liveStockFarmId;
    }

    public void setLiveStockFarmId(int liveStockFarmId) {
        this.liveStockFarmId = liveStockFarmId;
    }

    public String getAnimalsvaccinated() {
        return animalsvaccinated;
    }

    public void setAnimalsvaccinated(String animalsvaccinated) {
        this.animalsvaccinated = animalsvaccinated;
    }

    public String getPestSprayCarriedOut() {
        return pestSprayCarriedOut;
    }

    public void setPestSprayCarriedOut(String pestSprayCarriedOut) {
        this.pestSprayCarriedOut = pestSprayCarriedOut;
    }

    public String getInsuredVeterinaryDoctor() {
        return insuredVeterinaryDoctor;
    }

    public void setInsuredVeterinaryDoctor(String insuredVeterinaryDoctor) {
        this.insuredVeterinaryDoctor = insuredVeterinaryDoctor;
    }

    public String getInhouseMedicalEmergency() {
        return inhouseMedicalEmergency;
    }

    public void setInhouseMedicalEmergency(String inhouseMedicalEmergency) {
        this.inhouseMedicalEmergency = inhouseMedicalEmergency;
    }

    public String getAnimalsTagged() {
        return animalsTagged;
    }

    public void setAnimalsTagged(String animalsTagged) {
        this.animalsTagged = animalsTagged;
    }

    public String getDistanceBetweenAnimals() {
        return distanceBetweenAnimals;
    }

    public void setDistanceBetweenAnimals(String distanceBetweenAnimals) {
        this.distanceBetweenAnimals = distanceBetweenAnimals;
    }

    public String getAnimalsEmergencyEvacuationMap() {
        return animalsEmergencyEvacuationMap;
    }

    public void setAnimalsEmergencyEvacuationMap(String animalsEmergencyEvacuationMap) {
        this.animalsEmergencyEvacuationMap = animalsEmergencyEvacuationMap;
    }

    public String getUnauthorizedEntryInFarm() {
        return unauthorizedEntryInFarm;
    }

    public void setUnauthorizedEntryInFarm(String unauthorizedEntryInFarm) {
        this.unauthorizedEntryInFarm = unauthorizedEntryInFarm;
    }

    public String getWasteManagementFacility() {
        return wasteManagementFacility;
    }

    public void setWasteManagementFacility(String wasteManagementFacility) {
        this.wasteManagementFacility = wasteManagementFacility;
    }

    public String getSevereWeatherResistSheds() {
        return severeWeatherResistSheds;
    }

    public void setSevereWeatherResistSheds(String severeWeatherResistSheds) {
        this.severeWeatherResistSheds = severeWeatherResistSheds;
    }

    public RAForms getRaForm() {
        return raForm;
    }

    public void setRaForm(RAForms raForm) {
        this.raForm = raForm;
    }
}

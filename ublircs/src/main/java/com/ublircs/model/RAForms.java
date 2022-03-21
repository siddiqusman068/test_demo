package com.ublircs.model;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

/**
 * Created by Usman Siddiq on 26/11/2020.
 */
@Entity
@Table(name = "RAForms")
public class RAForms implements Serializable {

    private static final long serialVersionUID = 989192250380037359L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int raFormId;

    @Column(name = "RAFormNo")
    private String raFormNo;

    @Column(name = "OldRAFormNo")
    private String oldRAFormNo;

    @Column(name = "RiskCost")
    private String riskCost;

    @Column(name = "PolicyNo")
    private String policyNo;

    @Column(name = "InsuredName")
    private String insuredName;

    @Column(name = "VisitDate")
    private String visitDate;

    @Column(name = "SumInsured")
    private String sumInsured;

    @Column(name = "HeadOfficeAddress")
    private String headOfficeAddress;

    @Column(name = "PersonMet")
    private String personMet;

    @Column(name = "InspectedBy")
    private String inspectedBy;

    @Column(name = "NatureOfBusinessOccupation")
    private String natureOfBusinessOccupation;

    @Column(name = "LossHistoryDate")
    private String lossHistoryDate;

    @Column(name = "LossHistoryAmount")
    private String lossHistoryAmount;

    @Column(name = "SubjectMatter")
    private String subjectMatter;

    @Column(name = "Waiver")
    private String waiver;

    /*@Column(name = "UnderWrittenInBranchName")
    private String underWrittenInBranchName;*/

    // General Information

    @Column(name = "PremisesOwnedRented")
    private String premisesOwnedRented;

    @Column(name = "MultipleTenancy")
    private String multipleTenancy;

    @Column(name = "PremisesSurrounding")
    private String premisesSurrounding;

    @Column(name = "FrontSurrondingsDetails")
    private String frontSurrondingsDetails;

    @Column(name = "BackSurrondingsDetails")
    private String backSurrondingsDetails;

    @Column(name = "LeftSurrondingsDetails")
    private String leftSurrondingsDetails;

    @Column(name = "RightSurrondingsDetails")
    private String rightSurrondingsDetails;

    @Column(name = "YearBuilt")
    private String yearBuilt;

    @Column(name = "NoOfFloors")
    private String noOfFloors;

    @Column(name = "CoveredArea")
    private String coveredArea;

    @Column(name = "RoofType")
    private String roofType;

    @Column(name = "PlinthLevel")
    private String plinthLevel;

    @Column(name = "FloorCondition")
    private String floorCondition;

    @Column(name = "ElectricityWiring")
    private String electricityWiring;

    @Column(name = "HouseKeeping")
    private String houseKeeping;

    @Column(name = "CigaretteSmoking")
    private String cigaretteSmoking;

    @Column(name = "StorageArrangements")
    private String storageArrangements;

    @Column(name = "RawMaterialStored")
    private String rawMaterialStored;

    @Column(name = "StoredIn")
    private String storedIn;

    @Column(name = "TypeCylinders")
    private String typeCylinders;

    @Column(name = "NoOfCylinders")
    private String noofCylinders;

    @Column(name = "HazardousMaterialStored")
    private String hazardousMaterialStored;

    @Column(name = "NightWork")
    private String nightWork;

    @Column(name = "WarehousesElectrified")
    private String warehousesElectrified;

    @Column(name = "SecurityArrangement")
    private String securityArrangement;

    @Column(name = "CCTVCameras")
    private String cctvCameras;

    @Column(name = "NoofcctvCameras")
    private String noofcctvCameras;

    @Column(name = "FireFightingTeam")
    private String fireFightingTeam;

    @Column(name = "FrequencyOfDrill")
    private String frequencyOfDrill;

    @Column(name = "FireExitsProvided")
    private String fireExitsProvided;

    @Column(name = "NoOfFireExtinguishers")
    private String noOfFireExtinguishers;

    @Column(name = "NoOfFireBuckets")
    private String noOfFireBuckets;

    @Column(name = "HydrantSystem")
    private String hydrantSystem;

    @Column(name = "NoOfHydrantPoints")
    private String noofHydrantPoints;

    @Column(name = "NoOfFireHoses")
    private String noofFireHoses;

    @Column(name = "HydrantPumpCapacity")
    private String hydrantpumpCapacity;

    @Column(name = "HydrantPressure")
    private String hydrantPressure;

    @Column(name = "HydrantPumpOperates")
    private String hydrantPumpOperates;

    @Column(name = "ElectricitySupply")
    private String electricitySupply;

    @Column(name = "CapacityUndergroundTank")
    private String capacityUndergroundTank;

    @Column(name = "CapacityOverheadTank")
    private String capacityOverheadTank;

    @Column(name = "SourcesOfWaterSupply")
    private String sourcesOfWaterSupply;

    @Column(name = "FireAlarmInstalled")
    private String fireAlarmInstalled;

    @Column(name = "SprinklerSystemInstalled")
    private String sprinklerSystemInstalled;

    @Column(name = "SmokeDetectorsInstalled")
    private String smokeDetectorsInstalled;

    @Column(name = "NearestHospital")
    private String nearestHospital;

    @Column(name = "ResponseTimeHospital")
    private String responseTimeHospital;

    @Column(name = "NearestPoliceStation")
    private String nearestPoliceStation;

    @Column(name = "ResponseTimePoliceStation")
    private String responseTimePoliceStation;

    @Column(name = "NearestFireStation")
    private String nearestFireStation;

    @Column(name = "ResponseTimeFireStation")
    private String ResponseTimeFireStation;

    @Column(name = "AccessibilityForFireFighters")
    private String accessibilityForFireFighters;

    @Column(name = "BoilerInstalled")
    private String boilerInstalled;

    @Column(name = "BoilerInstalledInUse")
    private String boilerInstalledInUse;

    @Column(name = "BoilerMake")
    private String boilerMake;

    @Column(name = "BoilerType")
    private String boilerType;

    @Column(name = "BoilerHeatedBy")
    private String boilerHeatedBy;

    @Column(name = "BoilerFitnessCertificate")
    private String boilerFitnessCertificate;

    @Column(name = "GeneratorInstalled")
    private String generatorInstalled;

    @Column(name = "GeneratorInstalledInUse")
    private String generatorInstalledInUse;

    @Column(name = "GeneratorMake")
    private String generatorMake;

    @Column(name = "GeneratorCapacity")
    private String generatorCapacity;

    @Column(name = "generatorKVA")
    private String generatorKVA;

    @Column(name = "GeneratorFuel")
    private String generatorFuel;

    @Column(name = "GeneratorInterconnected")
    private String generatorInterconnected;

    @Column(name = "TransformerInstalled")
    private String transformerInstalled;

    @Column(name = "TransformerMake")
    private String transformerMake;

    @Column(name = "TransformerCapacity")
    private String transformerCapacity;

    @Column(name = "TransformerKVA")
    private String transformerKVA;

    @Column(name = "LeakagesFound")
    private String leakagesFound;

    @Column(name = "LeakagesFoundDetails")
    private String leakagesFoundDetails;

    @Column(name = "MachineryCondition")
    private String machineryCondition;

    @Column(name = "MaintenanceCarried")
    private String maintenanceCarried;

    @Column(name = "SparkArrestorsFixed")
    private String sparkArrestorsFixed;

    @Column(name = "SecurityGuardsDuty")
    private String securityGuardsDuty;

    @Column(name = "NoOfFireFighters")
    private String noOfFireFighters;

    @Column(name = "MaintenanceType")
    private String maintenanceType;

    @Column(name = "LaborUnion")
    private String laborUnion;

    @Column(name = "HazardousMaterialName")
    private String hazardousMaterialName;

    @Column(name = "NoOfEmployeesDay")
    private String noOfEmployeesDay;

    @Column(name = "NoOfEmployeesNight")
    private String noOfEmployeesNight;

    @Column(name = "NoOfSecurityGuardsDay")
    private String noOfSecurityGuardsDay;

    @Column(name = "NoOfSecurityGuardsNight")
    private String noOfSecurityGuardsNight;

    @Column(name = "ProductionCapacity")
    private String productionCapacity;

    @Column(name = "NoOfTrainedFireFighters")
    private String noOfTrainedFireFighters;

    @Column(name = "HotWorkPermit")
    private String hotWorkPermit;

    @Column(name = "MotorTurbineCapacity")
    private String motorTurbineCapacity;

    @Column(name = "IndustryType")
    private String industryType;

    @Column(name = "Findings")
    private String findings;

    @Column(name = "IsAssignedTo")
    private String assignedTo;

    @Column(name = "AssignedToName")
    private String assignedToName;

    @Column(name = "REFBuildings")
    private byte refBuildings;

    @Column(name = "REFPlantMachinery")
    private byte refPlantMachinery;

    @Column(name = "REFPartitioning")
    private byte refPartitioning;

    @Column(name = "REFProcessHazards")
    private byte refProcessHazards;

    @Column(name = "REFStocks")
    private byte refStocks;

    @Column(name = "REFElectrifications")
    private byte refElectrifications;

    @Column(name = "REFHousekeeping")
    private byte refHousekeeping;

    @Column(name = "REFFirefighting")
    private byte refFirefighting;

    @Column(name = "REFPostFireArrangements")
    private byte refPostFireArrangements;

    @Column(name = "REFSecurityArrangements")
    private byte refSecurityArrangements;

    @Column(name = "TotalRiskFactors")
    private byte totalRiskFactors;

    @Column(name = "Ranks")
    private String ranks;

    @Column(name = "Status")
    private String status;

    @Column(name = "OverAllRanking")
    private String overAllRanking;

    @Column(name = "WaiverReason")
    private String waiverReason;

    @Column(name = "Created")
    private Date created;

    @Column(name = "Modified")
    private Date modified;

    @Column(name = "ModifiedBy")
    private String modifiedBy;

    @OneToOne
    @JoinColumn(name = "BranchId")
    private Branches branches;

    @OneToOne
    @JoinColumn(name = "UserId")
    private Users users;

    @OneToOne
    @JoinColumn(name = "RiskLocationId")
    private RiskLocations riskLocations;


    public int getRaFormId() {
        return raFormId;
    }

    public void setRaFormId(int raFormId) {
        this.raFormId = raFormId;
    }

    public String getRaFormNo() {
        return raFormNo;
    }

    public void setRaFormNo(String raFormNo) {
        this.raFormNo = raFormNo;
    }

    public String getOldRAFormNo() {
        return oldRAFormNo;
    }

    public void setOldRAFormNo(String oldRAFormNo) {
        this.oldRAFormNo = oldRAFormNo;
    }

    public String getRiskCost() {
        return riskCost;
    }

    public void setRiskCost(String riskCost) {
        this.riskCost = riskCost;
    }

    public String getPolicyNo() {
        return policyNo;
    }

    public void setPolicyNo(String policyNo) {
        this.policyNo = policyNo;
    }

    public String getInsuredName() {
        return insuredName;
    }

    public void setInsuredName(String insuredName) {
        this.insuredName = insuredName;
    }

    public String getVisitDate() {
        return visitDate;
    }

    public void setVisitDate(String visitDate) {
        this.visitDate = visitDate;
    }

    public String getSumInsured() {
        return sumInsured;
    }

    public void setSumInsured(String sumInsured) {
        this.sumInsured = sumInsured;
    }

    public String getHeadOfficeAddress() {
        return headOfficeAddress;
    }

    public void setHeadOfficeAddress(String headOfficeAddress) {
        this.headOfficeAddress = headOfficeAddress;
    }

    public String getPersonMet() {
        return personMet;
    }

    public void setPersonMet(String personMet) {
        this.personMet = personMet;
    }

    public String getInspectedBy() {
        return inspectedBy;
    }

    public void setInspectedBy(String inspectedBy) {
        this.inspectedBy = inspectedBy;
    }

    public String getNatureOfBusinessOccupation() {
        return natureOfBusinessOccupation;
    }

    public void setNatureOfBusinessOccupation(String natureOfBusinessOccupation) {
        this.natureOfBusinessOccupation = natureOfBusinessOccupation;
    }

    public String getLossHistoryDate() {
        return lossHistoryDate;
    }

    public void setLossHistoryDate(String lossHistoryDate) {
        this.lossHistoryDate = lossHistoryDate;
    }

    public String getLossHistoryAmount() {
        return lossHistoryAmount;
    }

    public void setLossHistoryAmount(String lossHistoryAmount) {
        this.lossHistoryAmount = lossHistoryAmount;
    }

    public String getSubjectMatter() {
        return subjectMatter;
    }

    public void setSubjectMatter(String subjectMatter) {
        this.subjectMatter = subjectMatter;
    }

    public String getWaiver() {
        return waiver;
    }

    public void setWaiver(String waiver) {
        this.waiver = waiver;
    }

    public String getPremisesOwnedRented() {
        return premisesOwnedRented;
    }

    public void setPremisesOwnedRented(String premisesOwnedRented) {
        this.premisesOwnedRented = premisesOwnedRented;
    }

    public String getMultipleTenancy() {
        return multipleTenancy;
    }

    public void setMultipleTenancy(String multipleTenancy) {
        this.multipleTenancy = multipleTenancy;
    }

    public String getPremisesSurrounding() {
        return premisesSurrounding;
    }

    public void setPremisesSurrounding(String premisesSurrounding) {
        this.premisesSurrounding = premisesSurrounding;
    }

    public String getFrontSurrondingsDetails() {
        return frontSurrondingsDetails;
    }

    public void setFrontSurrondingsDetails(String frontSurrondingsDetails) {
        this.frontSurrondingsDetails = frontSurrondingsDetails;
    }

    public String getBackSurrondingsDetails() {
        return backSurrondingsDetails;
    }

    public void setBackSurrondingsDetails(String backSurrondingsDetails) {
        this.backSurrondingsDetails = backSurrondingsDetails;
    }

    public String getLeftSurrondingsDetails() {
        return leftSurrondingsDetails;
    }

    public void setLeftSurrondingsDetails(String leftSurrondingsDetails) {
        this.leftSurrondingsDetails = leftSurrondingsDetails;
    }

    public String getRightSurrondingsDetails() {
        return rightSurrondingsDetails;
    }

    public void setRightSurrondingsDetails(String rightSurrondingsDetails) {
        this.rightSurrondingsDetails = rightSurrondingsDetails;
    }

    public String getYearBuilt() {
        return yearBuilt;
    }

    public void setYearBuilt(String yearBuilt) {
        this.yearBuilt = yearBuilt;
    }

    public String getNoOfFloors() {
        return noOfFloors;
    }

    public void setNoOfFloors(String noOfFloors) {
        this.noOfFloors = noOfFloors;
    }

    public String getCoveredArea() {
        return coveredArea;
    }

    public void setCoveredArea(String coveredArea) {
        this.coveredArea = coveredArea;
    }

    public String getRoofType() {
        return roofType;
    }

    public void setRoofType(String roofType) {
        this.roofType = roofType;
    }

    public String getPlinthLevel() {
        return plinthLevel;
    }

    public void setPlinthLevel(String plinthLevel) {
        this.plinthLevel = plinthLevel;
    }

    public String getFloorCondition() {
        return floorCondition;
    }

    public void setFloorCondition(String floorCondition) {
        this.floorCondition = floorCondition;
    }

    public String getElectricityWiring() {
        return electricityWiring;
    }

    public void setElectricityWiring(String electricityWiring) {
        this.electricityWiring = electricityWiring;
    }

    public String getHouseKeeping() {
        return houseKeeping;
    }

    public void setHouseKeeping(String houseKeeping) {
        this.houseKeeping = houseKeeping;
    }

    public String getCigaretteSmoking() {
        return cigaretteSmoking;
    }

    public void setCigaretteSmoking(String cigaretteSmoking) {
        this.cigaretteSmoking = cigaretteSmoking;
    }

    public String getStorageArrangements() {
        return storageArrangements;
    }

    public void setStorageArrangements(String storageArrangements) {
        this.storageArrangements = storageArrangements;
    }

    public String getRawMaterialStored() {
        return rawMaterialStored;
    }

    public void setRawMaterialStored(String rawMaterialStored) {
        this.rawMaterialStored = rawMaterialStored;
    }

    public String getStoredIn() {
        return storedIn;
    }

    public void setStoredIn(String storedIn) {
        this.storedIn = storedIn;
    }

    public String getTypeCylinders() {
        return typeCylinders;
    }

    public void setTypeCylinders(String typeCylinders) {
        this.typeCylinders = typeCylinders;
    }

    public String getNoofCylinders() {
        return noofCylinders;
    }

    public void setNoofCylinders(String noofCylinders) {
        this.noofCylinders = noofCylinders;
    }

    public String getHazardousMaterialStored() {
        return hazardousMaterialStored;
    }

    public void setHazardousMaterialStored(String hazardousMaterialStored) {
        this.hazardousMaterialStored = hazardousMaterialStored;
    }

    public String getNightWork() {
        return nightWork;
    }

    public void setNightWork(String nightWork) {
        this.nightWork = nightWork;
    }

    public String getWarehousesElectrified() {
        return warehousesElectrified;
    }

    public void setWarehousesElectrified(String warehousesElectrified) {
        this.warehousesElectrified = warehousesElectrified;
    }

    public String getSecurityArrangement() {
        return securityArrangement;
    }

    public void setSecurityArrangement(String securityArrangement) {
        this.securityArrangement = securityArrangement;
    }

    public String getCctvCameras() {
        return cctvCameras;
    }

    public void setCctvCameras(String cctvCameras) {
        this.cctvCameras = cctvCameras;
    }

    public String getNoofcctvCameras() {
        return noofcctvCameras;
    }

    public void setNoofcctvCameras(String noofcctvCameras) {
        this.noofcctvCameras = noofcctvCameras;
    }

    public String getFireFightingTeam() {
        return fireFightingTeam;
    }

    public void setFireFightingTeam(String fireFightingTeam) {
        this.fireFightingTeam = fireFightingTeam;
    }

    public String getFrequencyOfDrill() {
        return frequencyOfDrill;
    }

    public void setFrequencyOfDrill(String frequencyOfDrill) {
        this.frequencyOfDrill = frequencyOfDrill;
    }

    public String getFireExitsProvided() {
        return fireExitsProvided;
    }

    public void setFireExitsProvided(String fireExitsProvided) {
        this.fireExitsProvided = fireExitsProvided;
    }

    public String getNoOfFireExtinguishers() {
        return noOfFireExtinguishers;
    }

    public void setNoOfFireExtinguishers(String noOfFireExtinguishers) {
        this.noOfFireExtinguishers = noOfFireExtinguishers;
    }

    public String getNoOfFireBuckets() {
        return noOfFireBuckets;
    }

    public void setNoOfFireBuckets(String noOfFireBuckets) {
        this.noOfFireBuckets = noOfFireBuckets;
    }

    public String getHydrantSystem() {
        return hydrantSystem;
    }

    public void setHydrantSystem(String hydrantSystem) {
        this.hydrantSystem = hydrantSystem;
    }

    public String getNoofHydrantPoints() {
        return noofHydrantPoints;
    }

    public void setNoofHydrantPoints(String noofHydrantPoints) {
        this.noofHydrantPoints = noofHydrantPoints;
    }

    public String getNoofFireHoses() {
        return noofFireHoses;
    }

    public void setNoofFireHoses(String noofFireHoses) {
        this.noofFireHoses = noofFireHoses;
    }

    public String getHydrantpumpCapacity() {
        return hydrantpumpCapacity;
    }

    public void setHydrantpumpCapacity(String hydrantpumpCapacity) {
        this.hydrantpumpCapacity = hydrantpumpCapacity;
    }

    public String getHydrantPressure() {
        return hydrantPressure;
    }

    public void setHydrantPressure(String hydrantPressure) {
        this.hydrantPressure = hydrantPressure;
    }

    public String getHydrantPumpOperates() {
        return hydrantPumpOperates;
    }

    public void setHydrantPumpOperates(String hydrantPumpOperates) {
        this.hydrantPumpOperates = hydrantPumpOperates;
    }

    public String getElectricitySupply() {
        return electricitySupply;
    }

    public void setElectricitySupply(String electricitySupply) {
        this.electricitySupply = electricitySupply;
    }

    public String getCapacityUndergroundTank() {
        return capacityUndergroundTank;
    }

    public void setCapacityUndergroundTank(String capacityUndergroundTank) {
        this.capacityUndergroundTank = capacityUndergroundTank;
    }

    public String getCapacityOverheadTank() {
        return capacityOverheadTank;
    }

    public void setCapacityOverheadTank(String capacityOverheadTank) {
        this.capacityOverheadTank = capacityOverheadTank;
    }

    public String getSourcesOfWaterSupply() {
        return sourcesOfWaterSupply;
    }

    public void setSourcesOfWaterSupply(String sourcesOfWaterSupply) {
        this.sourcesOfWaterSupply = sourcesOfWaterSupply;
    }

    public String getFireAlarmInstalled() {
        return fireAlarmInstalled;
    }

    public void setFireAlarmInstalled(String fireAlarmInstalled) {
        this.fireAlarmInstalled = fireAlarmInstalled;
    }

    public String getSprinklerSystemInstalled() {
        return sprinklerSystemInstalled;
    }

    public void setSprinklerSystemInstalled(String sprinklerSystemInstalled) {
        this.sprinklerSystemInstalled = sprinklerSystemInstalled;
    }

    public String getSmokeDetectorsInstalled() {
        return smokeDetectorsInstalled;
    }

    public void setSmokeDetectorsInstalled(String smokeDetectorsInstalled) {
        this.smokeDetectorsInstalled = smokeDetectorsInstalled;
    }

    public String getNearestHospital() {
        return nearestHospital;
    }

    public void setNearestHospital(String nearestHospital) {
        this.nearestHospital = nearestHospital;
    }

    public String getResponseTimeHospital() {
        return responseTimeHospital;
    }

    public void setResponseTimeHospital(String responseTimeHospital) {
        this.responseTimeHospital = responseTimeHospital;
    }

    public String getNearestPoliceStation() {
        return nearestPoliceStation;
    }

    public void setNearestPoliceStation(String nearestPoliceStation) {
        this.nearestPoliceStation = nearestPoliceStation;
    }

    public String getResponseTimePoliceStation() {
        return responseTimePoliceStation;
    }

    public void setResponseTimePoliceStation(String responseTimePoliceStation) {
        this.responseTimePoliceStation = responseTimePoliceStation;
    }

    public String getNearestFireStation() {
        return nearestFireStation;
    }

    public void setNearestFireStation(String nearestFireStation) {
        this.nearestFireStation = nearestFireStation;
    }

    public String getResponseTimeFireStation() {
        return ResponseTimeFireStation;
    }

    public void setResponseTimeFireStation(String responseTimeFireStation) {
        ResponseTimeFireStation = responseTimeFireStation;
    }

    public String getAccessibilityForFireFighters() {
        return accessibilityForFireFighters;
    }

    public void setAccessibilityForFireFighters(String accessibilityForFireFighters) {
        this.accessibilityForFireFighters = accessibilityForFireFighters;
    }

    public String getBoilerInstalled() {
        return boilerInstalled;
    }

    public void setBoilerInstalled(String boilerInstalled) {
        this.boilerInstalled = boilerInstalled;
    }

    public String getBoilerInstalledInUse() {
        return boilerInstalledInUse;
    }

    public void setBoilerInstalledInUse(String boilerInstalledInUse) {
        this.boilerInstalledInUse = boilerInstalledInUse;
    }

    public String getBoilerMake() {
        return boilerMake;
    }

    public void setBoilerMake(String boilerMake) {
        this.boilerMake = boilerMake;
    }

    public String getBoilerType() {
        return boilerType;
    }

    public void setBoilerType(String boilerType) {
        this.boilerType = boilerType;
    }

    public String getBoilerHeatedBy() {
        return boilerHeatedBy;
    }

    public void setBoilerHeatedBy(String boilerHeatedBy) {
        this.boilerHeatedBy = boilerHeatedBy;
    }

    public String getBoilerFitnessCertificate() {
        return boilerFitnessCertificate;
    }

    public void setBoilerFitnessCertificate(String boilerFitnessCertificate) {
        this.boilerFitnessCertificate = boilerFitnessCertificate;
    }

    public String getGeneratorInstalled() {
        return generatorInstalled;
    }

    public void setGeneratorInstalled(String generatorInstalled) {
        this.generatorInstalled = generatorInstalled;
    }

    public String getGeneratorInstalledInUse() {
        return generatorInstalledInUse;
    }

    public void setGeneratorInstalledInUse(String generatorInstalledInUse) {
        this.generatorInstalledInUse = generatorInstalledInUse;
    }

    public String getGeneratorMake() {
        return generatorMake;
    }

    public void setGeneratorMake(String generatorMake) {
        this.generatorMake = generatorMake;
    }

    public String getGeneratorCapacity() {
        return generatorCapacity;
    }

    public void setGeneratorCapacity(String generatorCapacity) {
        this.generatorCapacity = generatorCapacity;
    }

    public String getGeneratorKVA() {
        return generatorKVA;
    }

    public void setGeneratorKVA(String generatorKVA) {
        this.generatorKVA = generatorKVA;
    }

    public String getGeneratorFuel() {
        return generatorFuel;
    }

    public void setGeneratorFuel(String generatorFuel) {
        this.generatorFuel = generatorFuel;
    }

    public String getGeneratorInterconnected() {
        return generatorInterconnected;
    }

    public void setGeneratorInterconnected(String generatorInterconnected) {
        this.generatorInterconnected = generatorInterconnected;
    }

    public String getTransformerInstalled() {
        return transformerInstalled;
    }

    public void setTransformerInstalled(String transformerInstalled) {
        this.transformerInstalled = transformerInstalled;
    }

    public String getTransformerMake() {
        return transformerMake;
    }

    public void setTransformerMake(String transformerMake) {
        this.transformerMake = transformerMake;
    }

    public String getTransformerCapacity() {
        return transformerCapacity;
    }

    public void setTransformerCapacity(String transformerCapacity) {
        this.transformerCapacity = transformerCapacity;
    }

    public String getTransformerKVA() {
        return transformerKVA;
    }

    public void setTransformerKVA(String transformerKVA) {
        this.transformerKVA = transformerKVA;
    }

    public String getLeakagesFound() {
        return leakagesFound;
    }

    public void setLeakagesFound(String leakagesFound) {
        this.leakagesFound = leakagesFound;
    }

    public String getLeakagesFoundDetails() {
        return leakagesFoundDetails;
    }

    public void setLeakagesFoundDetails(String leakagesFoundDetails) {
        this.leakagesFoundDetails = leakagesFoundDetails;
    }

    public String getMachineryCondition() {
        return machineryCondition;
    }

    public void setMachineryCondition(String machineryCondition) {
        this.machineryCondition = machineryCondition;
    }

    public String getMaintenanceCarried() {
        return maintenanceCarried;
    }

    public void setMaintenanceCarried(String maintenanceCarried) {
        this.maintenanceCarried = maintenanceCarried;
    }

    public String getSparkArrestorsFixed() {
        return sparkArrestorsFixed;
    }

    public void setSparkArrestorsFixed(String sparkArrestorsFixed) {
        this.sparkArrestorsFixed = sparkArrestorsFixed;
    }

    public String getSecurityGuardsDuty() {
        return securityGuardsDuty;
    }

    public void setSecurityGuardsDuty(String securityGuardsDuty) {
        this.securityGuardsDuty = securityGuardsDuty;
    }

    public String getFindings() {
        return findings;
    }

    public void setFindings(String findings) {
        this.findings = findings;
    }

    public String getAssignedTo() {
        return assignedTo;
    }

    public void setAssignedTo(String assignedTo) {
        this.assignedTo = assignedTo;
    }

    public String getAssignedToName() {
        return assignedToName;
    }

    public void setAssignedToName(String assignedToName) {
        this.assignedToName = assignedToName;
    }

    public byte getRefBuildings() {
        return refBuildings;
    }

    public void setRefBuildings(byte refBuildings) {
        this.refBuildings = refBuildings;
    }

    public byte getRefPlantMachinery() {
        return refPlantMachinery;
    }

    public void setRefPlantMachinery(byte refPlantMachinery) {
        this.refPlantMachinery = refPlantMachinery;
    }

    public byte getRefPartitioning() {
        return refPartitioning;
    }

    public void setRefPartitioning(byte refPartitioning) {
        this.refPartitioning = refPartitioning;
    }

    public byte getRefProcessHazards() {
        return refProcessHazards;
    }

    public void setRefProcessHazards(byte refProcessHazards) {
        this.refProcessHazards = refProcessHazards;
    }

    public byte getRefStocks() {
        return refStocks;
    }

    public void setRefStocks(byte refStocks) {
        this.refStocks = refStocks;
    }

    public byte getRefElectrifications() {
        return refElectrifications;
    }

    public void setRefElectrifications(byte refElectrifications) {
        this.refElectrifications = refElectrifications;
    }

    public byte getRefHousekeeping() {
        return refHousekeeping;
    }

    public void setRefHousekeeping(byte refHousekeeping) {
        this.refHousekeeping = refHousekeeping;
    }

    public byte getRefFirefighting() {
        return refFirefighting;
    }

    public void setRefFirefighting(byte refFirefighting) {
        this.refFirefighting = refFirefighting;
    }

    public byte getRefPostFireArrangements() {
        return refPostFireArrangements;
    }

    public void setRefPostFireArrangements(byte refPostFireArrangements) {
        this.refPostFireArrangements = refPostFireArrangements;
    }

    public byte getRefSecurityArrangements() {
        return refSecurityArrangements;
    }

    public void setRefSecurityArrangements(byte refSecurityArrangements) {
        this.refSecurityArrangements = refSecurityArrangements;
    }

    public byte getTotalRiskFactors() {
        return totalRiskFactors;
    }

    public void setTotalRiskFactors(byte totalRiskFactors) {
        this.totalRiskFactors = totalRiskFactors;
    }

    public String getRanks() {
        return ranks;
    }

    public void setRanks(String ranks) {
        this.ranks = ranks;
    }

    public String getOverAllRanking() {
        return overAllRanking;
    }

    public void setOverAllRanking(String overAllRanking) {
        this.overAllRanking = overAllRanking;
    }

    public String getWaiverReason() {
        return waiverReason;
    }

    public void setWaiverReason(String waiverReason) {
        this.waiverReason = waiverReason;
    }

    public Branches getBranches() {
        return branches;
    }

    public void setBranches(Branches branches) {
        this.branches = branches;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public String getNoOfFireFighters() {
        return noOfFireFighters;
    }

    public void setNoOfFireFighters(String noOfFireFighters) {
        this.noOfFireFighters = noOfFireFighters;
    }

    public String getMaintenanceType() {
        return maintenanceType;
    }

    public void setMaintenanceType(String maintenanceType) {
        this.maintenanceType = maintenanceType;
    }

    public String getLaborUnion() {
        return laborUnion;
    }

    public void setLaborUnion(String laborUnion) {
        this.laborUnion = laborUnion;
    }

    public String getHazardousMaterialName() {
        return hazardousMaterialName;
    }

    public void setHazardousMaterialName(String hazardousMaterialName) {
        this.hazardousMaterialName = hazardousMaterialName;
    }

    public String getNoOfEmployeesDay() {
        return noOfEmployeesDay;
    }

    public void setNoOfEmployeesDay(String noOfEmployeesDay) {
        this.noOfEmployeesDay = noOfEmployeesDay;
    }

    public String getNoOfEmployeesNight() {
        return noOfEmployeesNight;
    }

    public void setNoOfEmployeesNight(String noOfEmployeesNight) {
        this.noOfEmployeesNight = noOfEmployeesNight;
    }

    public String getNoOfSecurityGuardsDay() {
        return noOfSecurityGuardsDay;
    }

    public void setNoOfSecurityGuardsDay(String noOfSecurityGuardsDay) {
        this.noOfSecurityGuardsDay = noOfSecurityGuardsDay;
    }

    public String getProductionCapacity() {
        return productionCapacity;
    }

    public void setProductionCapacity(String productionCapacity) {
        this.productionCapacity = productionCapacity;
    }

    public String getNoOfTrainedFireFighters() {
        return noOfTrainedFireFighters;
    }

    public void setNoOfTrainedFireFighters(String noOfTrainedFireFighters) {
        this.noOfTrainedFireFighters = noOfTrainedFireFighters;
    }

    public String getHotWorkPermit() {
        return hotWorkPermit;
    }

    public void setHotWorkPermit(String hotWorkPermit) {
        this.hotWorkPermit = hotWorkPermit;
    }

    public String getMotorTurbineCapacity() {
        return motorTurbineCapacity;
    }

    public void setMotorTurbineCapacity(String motorTurbineCapacity) {
        this.motorTurbineCapacity = motorTurbineCapacity;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getModified() {
        return modified;
    }

    public void setModified(Date modified) {
        this.modified = modified;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public String getNoOfSecurityGuardsNight() {
        return noOfSecurityGuardsNight;
    }

    public void setNoOfSecurityGuardsNight(String noOfSecurityGuardsNight) {
        this.noOfSecurityGuardsNight = noOfSecurityGuardsNight;
    }

    public RiskLocations getRiskLocations() {
        return riskLocations;
    }

    public void setRiskLocations(RiskLocations riskLocations) {
        this.riskLocations = riskLocations;
    }

    public String getIndustryType() {
        return industryType;
    }

    public void setIndustryType(String industryType) {
        this.industryType = industryType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

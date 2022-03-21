package com.ublircs.controller.surveyors;

import com.ublircs.model.*;
import com.ublircs.service.*;
import com.ublircs.util.CustomList;
import com.ublircs.util.MailMail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.convert.converters.InvalidFormatException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Controller
@RequestMapping("/surveyor")
@SessionAttributes("name")
public class SurveyorsRAForms {

    @Autowired
    RAFormsService raFormsService;

    @Autowired
    RiskLocationService riskLocationService;

    @Autowired
    LocationReportsService locationReportsService;

    @Autowired
    LocationInspectionPicService locationInspectionPicService;

    @Autowired
    RCSLogService rcsLogService;

    @Autowired
    BranchesService branchesService;

    @Autowired
    SurveyorsService surveyorsService;

    @Autowired
    UsersService usersService;

    @Autowired
    RiskSpecificCosmeticsChemicalService riskSpecificCosmeticsChemicalService;

    @Autowired
    RiskSpecificTextileGarmentSpinningService riskSpecificTextileGarmentSpinningService;

    @Autowired
    RiskSpecificCottonGinningService riskSpecificCottonGinningService;

    @Autowired
    RiskSpecificOilFeedService riskSpecificOilFeedService;

    @Autowired
    RiskSpecificLiveStocksFarmsService riskSpecificLiveStocksFarmsService;

    @Autowired
    RiskSpecificPaperBoardService riskSpecificPaperBoardService;

    @Autowired
    private MailMail mailMail;

    @RequestMapping("/home")
    public String home(Model model){

        Surveyors surveyors = surveyorsService.findByUserName(retrieveLoggedinUserName());

        List<RAForms> allBranchWise = raFormsService.findAllByAssignTo(surveyors.getUserName());

        model.addAttribute("allBranchWise", allBranchWise);

        return "Surveyor/riskLocationGrid";
    }

    @RequestMapping("/riskLocations")
    public String risklocations(Model model){

        Surveyors surveyors = surveyorsService.findByUserName(retrieveLoggedinUserName());

        List<RAForms> allBranchWise = raFormsService.findAllByAssignTo(surveyors.getUserName());

        model.addAttribute("allBranchWise", allBranchWise);

        return "Surveyor/riskLocationGrid";
    }

    @RequestMapping("/addForm/{id}")
    public String surveyorsRAForm(@PathVariable("id") int id, Model model){

        RAForms raForms = raFormsService.findById(id);

        model.addAttribute("raForms",raForms);


        return "Surveyor/RAForm";
    }

    @RequestMapping(value = "/addForm/getSurveyorsRAForm",method = RequestMethod.GET)
    public String surveyorsRAFormPost(
           /* @RequestParam("hiddeninputriskCost") String hiddeninputriskCost,
            @RequestParam("hiddeninputinsuredName") String hiddeninputinsuredName,
            @RequestParam("hiddeninputvisitDate") String hiddeninputvisitDate,
            @RequestParam("hiddeninputriskLocation") String hiddeninputriskLocation,
            @RequestParam("hiddeninputheadOfficeAddress") String hiddeninputheadOfficeAddress,
            @RequestParam("hiddeninputpersonMet") String hiddeninputpersonMet,
            @RequestParam("hiddeninputinspectedBy") String hiddeninputinspectedBy,
            @RequestParam("hiddeninputnatureOfBusinessOccupation") String hiddeninputnatureOfBusinessOccupation,
            @RequestParam("hiddeninputlossHistoryDate") String hiddeninputlossHistoryDate,
            @RequestParam("hiddeninputlossHistoryAmount") String hiddeninputlossHistoryAmount,
            @RequestParam("hiddeninputsubjectMatter") String hiddeninputsubjectMatter,
            @RequestParam("hiddeninputsumInsured") String hiddeninputsumInsured,*/
           @RequestParam("rafId") int rafId,
           @RequestParam("hiddeninputpremisesOwnedRented") String hiddeninputpremisesOwnedRented,
           @RequestParam("hiddeninputmultipleTenancy") String hiddeninputmultipleTenancy,
           @RequestParam("hiddeninputpremisesSurrounding") String hiddeninputpremisesSurrounding,
           @RequestParam("hiddeninputyearBuilt") String hiddeninputyearBuilt,
           @RequestParam("hiddeninputnoOfFloors") String hiddeninputnoOfFloors,
           @RequestParam("hiddeninputcoveredArea") String hiddeninputcoveredArea,
           @RequestParam("hiddeninputroofType") String hiddeninputroofType,
           @RequestParam("hiddeninputplinthLevel") String hiddeninputplinthLevel,
           @RequestParam("hiddeninputfloorCondition") String hiddeninputfloorCondition,
           @RequestParam("hiddeninputelectricWiring") String hiddeninputelectricWiring,
           @RequestParam("hiddeninputhouseKeeping") String hiddeninputhouseKeeping,
           @RequestParam("hiddeninputcigaretteSmoking") String hiddeninputcigaretteSmoking,
           @RequestParam("hiddeninputstorageArrangements") String hiddeninputstorageArrangements,
           @RequestParam("hiddeninputrawMaterialStored") String hiddeninputrawMaterialStored,
           @RequestParam("hiddeninputstoredIn") String hiddeninputstoredIn,
           @RequestParam("hiddeninputtypeCylinders") String hiddeninputtypeCylinders,
           @RequestParam("hiddeninputnoofCylinders") String hiddeninputnoofCylinders,
           @RequestParam("hiddeninputhazardousMaterialStored") String hiddeninputhazardousMaterialStored,
           @RequestParam("hiddeninputnightWork") String hiddeninputnightWork,
           @RequestParam("hiddeninputwarehousesElectrified") String hiddeninputwarehousesElectrified,
           @RequestParam("hiddeninputsecurityArrangement") String hiddeninputsecurityArrangement,
           @RequestParam("hiddeninputcctvCameras") String hiddeninputcctvCameras,
           @RequestParam("hiddeninputnoofcctvCameras") String hiddeninputnoofcctvCameras,
           @RequestParam("hiddeninputfireFightingTeam") String hiddeninputfireFightingTeam,
           @RequestParam("hiddeninputfrequencyOfDrill") String hiddeninputfrequencyOfDrill,
           @RequestParam("hiddeninputfireExitsProvided") String hiddeninputfireExitsProvided,
           @RequestParam("hiddeninputnoOfFireExtinguishers") String hiddeninputnoOfFireExtinguishers,
           @RequestParam("hiddeninputnoOfFireBuckets") String hiddeninputnoOfFireBuckets,
           @RequestParam("hiddeninputhydrantSystem") String hiddeninputhydrantSystem,
           @RequestParam("hiddeninputnoofHydrantPoints") String hiddeninputnoofHydrantPoints,
           @RequestParam("hiddeninputnoofFireHoses") String hiddeninputnoofFireHoses,
           @RequestParam("hiddeninputhydrantpumpCapacity") String hiddeninputhydrantpumpCapacity,
           @RequestParam("hiddeninputhydrantPressure") String hiddeninputhydrantPressure,
           @RequestParam("hiddeninputhydrantPumpOperates") String hiddeninputhydrantPumpOperates,
           @RequestParam("hiddeninputelectricitySupply") String hiddeninputelectricitySupply,
           @RequestParam("hiddeninputcapacityUndergroundTank") String hiddeninputcapacityUndergroundTank,
           @RequestParam("hiddeninputcapacityOverheadTank") String hiddeninputcapacityOverheadTank,
           @RequestParam("hiddeninputsourcesOfWaterSupply") String hiddeninputsourcesOfWaterSupply,
           @RequestParam("hiddeninputfireAlarmInstalled") String hiddeninputfireAlarmInstalled,
           @RequestParam("hiddeninputsprinklerSystemInstalled") String hiddeninputsprinklerSystemInstalled,
           @RequestParam("hiddeninputsmokeDetectorsInstalled") String hiddeninputsmokeDetectorsInstalled,
           @RequestParam("hiddeninputnearestHospital") String hiddeninputnearestHospital,
           @RequestParam("hiddeninputresponseTimeHospital") String hiddeninputresponseTimeHospital,
           @RequestParam("hiddeninputnearestPoliceStation") String hiddeninputnearestPoliceStation,
           @RequestParam("hiddeninputresponseTimePoliceStation") String hiddeninputresponseTimePoliceStation,
           @RequestParam("hiddeninputnearestFireStation") String hiddeninputnearestFireStation,
           @RequestParam("hiddeninputresponseTimeFireStation") String hiddeninputresponseTimeFireStation,
           @RequestParam("hiddeninputaccessibilityForFireFighters") String hiddeninputaccessibilityForFireFighters,
           @RequestParam("hiddeninputboilerInstalled") String hiddeninputboilerInstalled,
           @RequestParam("hiddeninputboilerInstalledInUse") String hiddeninputboilerInstalledInUse,
           @RequestParam("hiddeninputboilerMake") String hiddeninputboilerMake,
           @RequestParam("hiddeninputboilerType") String hiddeninputboilerType,
           @RequestParam("hiddeninputboilerHeatedBy") String hiddeninputboilerHeatedBy,
           @RequestParam("hiddeninputboilerFitnessCertificate") String hiddeninputboilerFitnessCertificate,
           @RequestParam("hiddeninputgeneratorInstalled") String hiddeninputgeneratorInstalled,
           @RequestParam("hiddeninputgeneratorInstalledInUse") String hiddeninputgeneratorInstalledInUse,
           @RequestParam("hiddeninputgeneratorMake") String hiddeninputgeneratorMake,
           @RequestParam("hiddeninputgeneratorCapacity") String hiddeninputgeneratorCapacity,
           @RequestParam("hiddeninputgeneratorKVA") String hiddeninputgeneratorKVA,
           @RequestParam("hiddeninputgeneraorFuel") String hiddeninputgeneraorFuel,
           @RequestParam("hiddeninputgeneratorInterconnected") String hiddeninputgeneratorInterconnected,
           @RequestParam("hiddeninputtransformerInstalled") String hiddeninputtransformerInstalled,
           @RequestParam("hiddeninputtransformerMake") String hiddeninputtransformerMake,
           @RequestParam("hiddeninputtransformerCapacity") String hiddeninputtransformerCapacity,
           @RequestParam("hiddeninputtransformerKVA") String hiddeninputtransformerKVA,
           @RequestParam("hiddeninputleakagesFound") String hiddeninputleakagesFound,
           @RequestParam("hiddeninputleakagesFoundDetails") String hiddeninputleakagesFoundDetails,
           @RequestParam("hiddeninputmachineryCondition") String hiddeninputmachineryCondition,
           @RequestParam("hiddeninputmaintenanceCarried") String hiddeninputmaintenanceCarried,
           @RequestParam("hiddeninputsparkArrestorsFixed") String hiddeninputsparkArrestorsFixed,
           @RequestParam("hiddeninputsecurityGuardsDuty") String hiddeninputsecurityGuardsDuty,
           @RequestParam("hiddeninputnoOfFireFighters") String hiddeninputnoOfFireFighters,
           @RequestParam("hiddeninputmaintenanceType") String hiddeninputmaintenanceType,
           @RequestParam("hiddeninputlaborUnion") String hiddeninputlaborUnion,
           @RequestParam("hiddeninputhazardousMaterialName") String hiddeninputhazardousMaterialName,
           @RequestParam("hiddeninputnoOfEmployeesDay") String hiddeninputnoOfEmployeesDay,
           @RequestParam("hiddeninputnoOfEmployeesNight") String hiddeninputnoOfEmployeesNight,
           @RequestParam("hiddeninputnoOfSecurityGuardsDay") String hiddeninputnoOfSecurityGuardsDay,
           @RequestParam("hiddeninputnoOfSecurityGuardsNight") String hiddeninputnoOfSecurityGuardsNight,
           @RequestParam("hiddeninputproductionCapacity") String hiddeninputproductionCapacity,
           @RequestParam("hiddeninputnoOfCCTVCamera") String hiddeninputnoOfCCTVCamera,
           @RequestParam("hiddeninputnoOfTrainedFireFighters") String hiddeninputnoOfTrainedFireFighters,
           @RequestParam("hiddeninputmotorTurbineCapacity") String hiddeninputmotorTurbineCapacity,
           @RequestParam("hiddeninputhotWorkPermit") String hiddeninputhotWorkPermit,
           @RequestParam("hiddeninputindustries") String hiddeninputindustries,
           @RequestParam("hiddeninputpartitioningWalls") String hiddeninputpartitioningWalls,
           @RequestParam("hiddeninputfireproofdoorsInstalled") String hiddeninputfireproofdoorsInstalled,
           @RequestParam("hiddeninputstored30feetaway") String hiddeninputstored30feetaway,
           @RequestParam("hiddeninputstoredstockproductionarea") String hiddeninputstoredstockproductionarea,
           @RequestParam("hiddeninputgodownswarehouseselectrified") String hiddeninputgodownswarehouseselectrified,
           @RequestParam("hiddeninputseparateblowrooms") String hiddeninputseparateblowrooms,
           @RequestParam("hiddeninputcottondustcollection") String hiddeninputcottondustcollection,
           @RequestParam("hiddeninputstock50feetstored") String hiddeninputstock50feetstored,
           @RequestParam("hiddeninputinstalledspinningmills") String hiddeninputinstalledspinningmills,
           @RequestParam("hiddeninputphutticottonstack50feetstored") String hiddeninputphutticottonstack50feetstored,
           @RequestParam("hiddeninputcottonphuttistacked") String hiddeninputcottonphuttistacked,
           @RequestParam("hiddeninput2500FPIBcottonbalesstrored") String hiddeninput2500FPIBcottonbalesstrored,
           @RequestParam("hiddeninput1000FPIBcottonbalesstored") String hiddeninput1000FPIBcottonbalesstored,
           @RequestParam("hiddeninputmaximumheight6bales") String hiddeninputmaximumheight6bales,
           @RequestParam("hiddeninputstackdistance15feet") String hiddeninputstackdistance15feet,
           @RequestParam("hiddeninputlotsofbaledistance75feet") String hiddeninputlotsofbaledistance75feet,
           @RequestParam("hiddeninputcottonbalesdistance30feet") String hiddeninputcottonbalesdistance30feet,
           @RequestParam("hiddeninput10000FPIBcottonbalesstored") String hiddeninput10000FPIBcottonbalesstored,
           @RequestParam("hiddeninputstockstored50feet") String hiddeninputstockstored50feet,
           @RequestParam("hiddeninputcombustioncovered") String hiddeninputcombustioncovered,
           @RequestParam("hiddeninputcombustionsuminsuredpercent") String hiddeninputcombustionsuminsuredpercent,
           @RequestParam("hiddeninputnoofsilosatfactory") String hiddeninputnoofsilosatfactory,
           @RequestParam("hiddeninputseedstored") String hiddeninputseedstored,
           @RequestParam("hiddeninputdistancestocks4feet") String hiddeninputdistancestocks4feet,
           @RequestParam("hiddeninputfirelanesmarked") String hiddeninputfirelanesmarked,
           @RequestParam("hiddeninputstackheight15feet") String hiddeninputstackheight15feet,
           @RequestParam("hiddeninput8000bagsstacked") String hiddeninput8000bagsstacked,
           @RequestParam("hiddeninputgodownsventilated") String hiddeninputgodownsventilated,
           @RequestParam("hiddeninputhazardouschemicalstored") String hiddeninputhazardouschemicalstored,
           @RequestParam("hiddeninputchemicalseparatestored") String hiddeninputchemicalseparatestored,
           @RequestParam("hiddeninputchemicalseparatestored30feet") String hiddeninputchemicalseparatestored30feet,
           @RequestParam("hiddeninputrawmaterialquantity") String hiddeninputrawmaterialquantity,
           @RequestParam("hiddeninputfireextinguishersprovided") String hiddeninputfireextinguishersprovided,
           @RequestParam("hiddeninputpaperstock4inchesheight") String hiddeninputpaperstock4inchesheight,
           @RequestParam("hiddeninputpaperstock4inchesaway") String hiddeninputpaperstock4inchesaway,
           @RequestParam("hiddeninputpaperstockstoredopen") String hiddeninputpaperstockstoredopen,
           @RequestParam("hiddeninputpaperstackefeetbelow") String hiddeninputpaperstackefeetbelow,
           @RequestParam("hiddeninputpapergodownselectrified") String hiddeninputpapergodownselectrified,
           @RequestParam("hiddeninputanimalsvaccinated") String hiddeninputanimalsvaccinated,
           @RequestParam("hiddeninputpestSprayCarriedOut") String hiddeninputpestSprayCarriedOut,
           @RequestParam("hiddeninputinsuredVeterinaryDoctor") String hiddeninputinsuredVeterinaryDoctor,
           @RequestParam("hiddeninputinhouseMedicalEmergency") String hiddeninputinhouseMedicalEmergency,
           @RequestParam("hiddeninputanimalsTagged") String hiddeninputanimalsTagged,
           @RequestParam("hiddeninputdistanceBetweenAnimals") String hiddeninputdistanceBetweenAnimals,
           @RequestParam("hiddeninputanimalsEmergencyEvacuationMap") String hiddeninputanimalsEmergencyEvacuationMap,
           @RequestParam("hiddeninputunauthorizedEntryInFarm") String hiddeninputunauthorizedEntryInFarm,
           @RequestParam("hiddeninputwasteManagementFacility") String hiddeninputwasteManagementFacility,
           @RequestParam("hiddeninputsevereWeatherResistSheds") String hiddeninputsevereWeatherResistSheds,
           @RequestParam("hiddeninputFindings") String hiddeninputFindings,


           Model model) throws IOException {

        java.util.Date date = new Date();
        java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());

        RAForms raForms = raFormsService.findById(rafId);
        Users users = usersService.findUserByName(retrieveLoggedinUserName());
        Users sessionUser = usersService.findUserByName(retrieveLoggedinUserName());
       // Branches branches = branchesService.findById(users.getBranches().getBranchId());
        RCSLog rcsLog = new RCSLog();



        String mhiddeninputpremisesOwnedRented =  hiddeninputpremisesOwnedRented;
        raForms.setPremisesOwnedRented(mhiddeninputpremisesOwnedRented);
        String mhiddeninputmultipleTenancy =  hiddeninputmultipleTenancy;
        raForms.setMultipleTenancy(mhiddeninputmultipleTenancy);
        String mhiddeninputpremisesSurrounding =  hiddeninputpremisesSurrounding;
        raForms.setPremisesSurrounding(mhiddeninputpremisesSurrounding);
        String mhiddeninputyearBuilt =  hiddeninputyearBuilt;
        raForms.setYearBuilt(mhiddeninputyearBuilt);
        String mhiddeninputnoOfFloors =  hiddeninputnoOfFloors;
        raForms.setNoOfFloors(mhiddeninputnoOfFloors);
        String mhiddeninputcoveredArea =  hiddeninputcoveredArea;
        raForms.setCoveredArea(mhiddeninputcoveredArea);
        String mhiddeninputroofType =  hiddeninputroofType;
        raForms.setRoofType(mhiddeninputroofType);
        String mhiddeninputplinthLevel =  hiddeninputplinthLevel;
        raForms.setPlinthLevel(mhiddeninputplinthLevel);
        String mhiddeninputfloorCondition =  hiddeninputfloorCondition;
        raForms.setFloorCondition(mhiddeninputfloorCondition);
        String mhiddeninputelectricWiring =  hiddeninputelectricWiring;
        raForms.setElectricityWiring(mhiddeninputelectricWiring);
        String mhiddeninputhouseKeeping =  hiddeninputhouseKeeping;
        raForms.setHouseKeeping(mhiddeninputhouseKeeping);
        String mhiddeninputcigaretteSmoking =  hiddeninputcigaretteSmoking;
        raForms.setCigaretteSmoking(mhiddeninputcigaretteSmoking);
        String mhiddeninputstorageArrangements =  hiddeninputstorageArrangements;
        raForms.setStorageArrangements(mhiddeninputstorageArrangements);
        String mhiddeninputrawMaterialStored =  hiddeninputrawMaterialStored;
        raForms.setRawMaterialStored(mhiddeninputrawMaterialStored);
        String mhiddeninputstoredIn =  hiddeninputstoredIn;
        raForms.setStoredIn(mhiddeninputstoredIn);
        String mhiddeninputtypeCylinders =  hiddeninputtypeCylinders;
        raForms.setTypeCylinders(mhiddeninputtypeCylinders);
        String mhiddeninputnoofCylinders =  hiddeninputnoofCylinders;
        raForms.setNoofCylinders(mhiddeninputnoofCylinders);
        String mhiddeninputhazardousMaterialStored =  hiddeninputhazardousMaterialStored;
        raForms.setHazardousMaterialStored(mhiddeninputhazardousMaterialStored);
        String mhiddeninputnightWork =  hiddeninputnightWork;
        raForms.setNightWork(mhiddeninputnightWork);
        String mhiddeninputwarehousesElectrified =  hiddeninputwarehousesElectrified;
        raForms.setWarehousesElectrified(mhiddeninputwarehousesElectrified);
        String mhiddeninputsecurityArrangement =  hiddeninputsecurityArrangement;
        raForms.setSecurityArrangement(mhiddeninputsecurityArrangement);
        String mhiddeninputcctvCameras =  hiddeninputcctvCameras;
        raForms.setCctvCameras(mhiddeninputcctvCameras);
        String mhiddeninputnoofcctvCameras =  hiddeninputnoofcctvCameras;
        raForms.setNoofcctvCameras(mhiddeninputnoofcctvCameras);
        String mhiddeninputfireFightingTeam=  hiddeninputfireFightingTeam;
        raForms.setFireFightingTeam(mhiddeninputfireFightingTeam);
        String mhiddeninputfrequencyOfDrill =  hiddeninputfrequencyOfDrill;
        raForms.setFrequencyOfDrill(mhiddeninputfrequencyOfDrill);
        String mhiddeninputfireExitsProvided =  hiddeninputfireExitsProvided;
        raForms.setFireExitsProvided(mhiddeninputfireExitsProvided);
        String mhiddeninputnoOfFireExtinguishers =  hiddeninputnoOfFireExtinguishers;
        raForms.setNoOfFireExtinguishers(mhiddeninputnoOfFireExtinguishers);
        String mhiddeninputnoOfFireBuckets =  hiddeninputnoOfFireBuckets;
        raForms.setNoOfFireBuckets(mhiddeninputnoOfFireBuckets);
        String mhiddeninputhydrantSystem=  hiddeninputhydrantSystem;
        raForms.setHydrantSystem(mhiddeninputhydrantSystem);
        String mhiddeninputnoofHydrantPoints =  hiddeninputnoofHydrantPoints;
        raForms.setNoofHydrantPoints(mhiddeninputnoofHydrantPoints);
        String mhiddeninputnoofFireHoses =  hiddeninputnoofFireHoses;
        raForms.setNoofFireHoses(mhiddeninputnoofFireHoses);
        String mhiddeninputhydrantpumpCapacity =  hiddeninputhydrantpumpCapacity;
        raForms.setHydrantpumpCapacity(mhiddeninputhydrantpumpCapacity);
        String mhiddeninputhydrantPressure =  hiddeninputhydrantPressure;
        raForms.setHydrantPressure(mhiddeninputhydrantPressure);
        String mhiddeninputhydrantPumpOperates =  hiddeninputhydrantPumpOperates;
        raForms.setHydrantPumpOperates(mhiddeninputhydrantPumpOperates);
        String mhiddeninputelectricitySupply =  hiddeninputelectricitySupply;
        raForms.setElectricitySupply(mhiddeninputelectricitySupply);
        String mhiddeninputcapacityUndergroundTank =  hiddeninputcapacityUndergroundTank;
        raForms.setCapacityOverheadTank(mhiddeninputcapacityUndergroundTank);
        String mhiddeninputcapacityOverheadTank =  hiddeninputcapacityOverheadTank;
        raForms.setCapacityOverheadTank(mhiddeninputcapacityOverheadTank);
        String mhiddeninputsourcesOfWaterSupply =  hiddeninputsourcesOfWaterSupply;
        raForms.setSourcesOfWaterSupply(mhiddeninputsourcesOfWaterSupply);
        String mhiddeninputfireAlarmInstalled =  hiddeninputfireAlarmInstalled;
        raForms.setFireAlarmInstalled(mhiddeninputfireAlarmInstalled);
        String mhiddeninputsprinklerSystemInstalled =  hiddeninputsprinklerSystemInstalled;
        raForms.setSprinklerSystemInstalled(mhiddeninputsprinklerSystemInstalled);
        String mhiddeninputsmokeDetectorsInstalled =  hiddeninputsmokeDetectorsInstalled;
        raForms.setSmokeDetectorsInstalled(mhiddeninputsmokeDetectorsInstalled);
        String mhiddeninputnearestHospital =  hiddeninputnearestHospital;
        raForms.setNearestHospital(mhiddeninputnearestHospital);
        String mhiddeninputresponseTimeHospital =  hiddeninputresponseTimeHospital;
        raForms.setResponseTimeHospital(mhiddeninputresponseTimeHospital);
        String mhiddeninputnearestPoliceStation =  hiddeninputnearestPoliceStation;
        raForms.setNearestPoliceStation(mhiddeninputnearestPoliceStation);
        String mhiddeninputresponseTimePoliceStation =  hiddeninputresponseTimePoliceStation;
        raForms.setResponseTimePoliceStation(mhiddeninputresponseTimePoliceStation);
        String mhiddeninputnearestFireStation =  hiddeninputnearestFireStation;
        raForms.setNearestFireStation(mhiddeninputnearestFireStation);
        String mhiddeninputresponseTimeFireStation =  hiddeninputresponseTimeFireStation;
        raForms.setResponseTimeFireStation(mhiddeninputresponseTimeFireStation);
        String mhiddeninputaccessibilityForFireFighters =  hiddeninputaccessibilityForFireFighters;
        raForms.setAccessibilityForFireFighters(mhiddeninputaccessibilityForFireFighters);
        String mhiddeninputboilerInstalled =  hiddeninputboilerInstalled;
        raForms.setBoilerInstalled(mhiddeninputboilerInstalled);
        String mhiddeninputboilerInstalledInUse =  hiddeninputboilerInstalledInUse;
        raForms.setBoilerInstalledInUse(mhiddeninputboilerInstalledInUse);
        String mhiddeninputboilerMake =  hiddeninputboilerMake;
        raForms.setBoilerMake(mhiddeninputboilerMake);
        String mhiddeninputboilerType =  hiddeninputboilerType;
        raForms.setBoilerType(mhiddeninputboilerType);
        String mhiddeninputboilerHeatedBy =  hiddeninputboilerHeatedBy;
        raForms.setBoilerHeatedBy(mhiddeninputboilerHeatedBy);
        String mhiddeninputboilerFitnessCertificate =  hiddeninputboilerFitnessCertificate;
        raForms.setBoilerFitnessCertificate(mhiddeninputboilerFitnessCertificate);
        String mhiddeninputgeneratorInstalled =  hiddeninputgeneratorInstalled;
        raForms.setGeneratorInstalled(mhiddeninputgeneratorInstalled);
        String mhiddeninputgeneratorInstalledInUse =  hiddeninputgeneratorInstalledInUse;
        raForms.setGeneratorInstalledInUse(mhiddeninputgeneratorInstalledInUse);
        String mhiddeninputgeneratorMake =  hiddeninputgeneratorMake;
        raForms.setGeneratorMake(mhiddeninputgeneratorMake);
        String mhiddeninputgeneratorCapacity =  hiddeninputgeneratorCapacity;
        raForms.setGeneratorCapacity(mhiddeninputgeneratorCapacity);
        String mhiddeninputgeneratorKVA =  hiddeninputgeneratorKVA;
        raForms.setGeneratorInterconnected(mhiddeninputgeneratorKVA);
        String mhiddeninputgeneratorFuel =  hiddeninputgeneraorFuel;
        raForms.setGeneratorFuel(mhiddeninputgeneratorFuel);
        String mhiddeninputgeneratorInterconnected =  hiddeninputgeneratorInterconnected;
        raForms.setGeneratorInterconnected(mhiddeninputgeneratorInterconnected);
        String mhiddeninputtransformerInstalled =  hiddeninputtransformerInstalled;
        raForms.setTransformerInstalled(mhiddeninputtransformerInstalled);
        String mhiddeninputtransformerMake =  hiddeninputtransformerMake;
        raForms.setTransformerMake(mhiddeninputtransformerMake);
        String mhiddeninputtransformerCapacity =  hiddeninputtransformerCapacity;
        raForms.setTransformerCapacity(mhiddeninputtransformerCapacity);
        String mhiddeninputtransformerKVA =  hiddeninputtransformerKVA;
        raForms.setTransformerKVA(mhiddeninputtransformerKVA);
        String mhiddeninputleakagesFound =  hiddeninputleakagesFound;
        raForms.setLeakagesFound(mhiddeninputleakagesFound);
        String mhiddeninputleakagesFoundDetails =  hiddeninputleakagesFoundDetails;
        raForms.setLeakagesFoundDetails(mhiddeninputleakagesFoundDetails);
        String mhiddeninputmachineryCondition =  hiddeninputmachineryCondition;
        raForms.setMachineryCondition(mhiddeninputmachineryCondition);
        String mhiddeninputmaintenanceCarried =  hiddeninputmaintenanceCarried;
        raForms.setMaintenanceCarried(mhiddeninputmaintenanceCarried);
        String mhiddeninputsparkArrestorsFixed =  hiddeninputsparkArrestorsFixed;
        raForms.setSparkArrestorsFixed(mhiddeninputsparkArrestorsFixed);
        String mhiddeninputsecurityGuardsDuty =  hiddeninputsecurityGuardsDuty;
        raForms.setSecurityGuardsDuty(mhiddeninputsecurityGuardsDuty);
        String mhiddeninputnoOfFireFighters =  hiddeninputnoOfFireFighters;
        raForms.setNoOfFireFighters(mhiddeninputnoOfFireFighters);
        String mhiddeninputmaintenanceType =  hiddeninputmaintenanceType;
        raForms.setMaintenanceType(mhiddeninputmaintenanceType);



        String mhiddeninputlaborUnion =  hiddeninputlaborUnion;
        raForms.setLaborUnion(mhiddeninputlaborUnion);
        String mhiddeninputhazardousMaterialName =  hiddeninputhazardousMaterialName;
        raForms.setHazardousMaterialName(mhiddeninputhazardousMaterialName);
        String mhiddeninputnoOfEmployeesDay =  hiddeninputnoOfEmployeesDay;
        raForms.setNoOfEmployeesDay(mhiddeninputnoOfEmployeesDay);
        String mhiddeninputnoOfEmployeesNight =  hiddeninputnoOfEmployeesNight;
        raForms.setNoOfEmployeesNight(mhiddeninputnoOfEmployeesNight);
        String mhiddeninputnoOfSecurityGuardsDay =  hiddeninputnoOfSecurityGuardsDay;
        raForms.setNoOfSecurityGuardsDay(mhiddeninputnoOfSecurityGuardsDay);
        String mhiddeninputnoOfSecurityGuardsNight =  hiddeninputnoOfSecurityGuardsNight;
        raForms.setNoOfSecurityGuardsNight(mhiddeninputnoOfSecurityGuardsNight);
        String mhiddeninputproductionCapacity =  hiddeninputproductionCapacity;
        raForms.setProductionCapacity(mhiddeninputproductionCapacity);
        String mhiddeninputnoOfTrainedFireFighters =  hiddeninputnoOfTrainedFireFighters;
        raForms.setNoOfTrainedFireFighters(mhiddeninputnoOfTrainedFireFighters);
        String mhiddeninputmotorTurbineCapacity =  hiddeninputmotorTurbineCapacity;
        raForms.setMotorTurbineCapacity(mhiddeninputmotorTurbineCapacity);
        String mhiddeninputhotWorkPermit =  hiddeninputhotWorkPermit;
        raForms.setHotWorkPermit(mhiddeninputhotWorkPermit);
        String mhiddeninputFindings =  hiddeninputFindings;
        raForms.setFindings(mhiddeninputFindings);
        String mhiddeninputindustries =  hiddeninputindustries;
        raForms.setIndustryType(mhiddeninputindustries);
        raForms.setStatus("Under Inspection");


        raFormsService.edit(raForms);


        if (mhiddeninputindustries.equals("Specific Information for Textile/Garment Factory/Spinning Mills/Weaving Mills"))
        {

            RiskSpecificTextileGarmentSpinning riskSpecificTextileGarmentSpinning = new RiskSpecificTextileGarmentSpinning();

            String mhiddeninputpartitioningWalls =  hiddeninputpartitioningWalls;
            riskSpecificTextileGarmentSpinning.setPartitioningWalls(mhiddeninputpartitioningWalls);
            String mhiddeninputfireproofdoorsInstalled =  hiddeninputfireproofdoorsInstalled;
            riskSpecificTextileGarmentSpinning.setFireproofdoorsInstalled(mhiddeninputfireproofdoorsInstalled);
            String mhiddeninputstored30feetaway =  hiddeninputstored30feetaway;
            riskSpecificTextileGarmentSpinning.setStored30feetaway(mhiddeninputstored30feetaway);
            String mhiddeninputstoredstockproductionarea =  hiddeninputstoredstockproductionarea;
            riskSpecificTextileGarmentSpinning.setStoredstockproductionarea(mhiddeninputstoredstockproductionarea);
            String mhiddeninputgodownswarehouseselectrified =  hiddeninputgodownswarehouseselectrified;
            riskSpecificTextileGarmentSpinning.setGodownswarehouseselectrified(mhiddeninputgodownswarehouseselectrified);
            String mhiddeninputseparateblowrooms =  hiddeninputseparateblowrooms;
            riskSpecificTextileGarmentSpinning.setSeparateblowrooms(mhiddeninputseparateblowrooms);
            String mhiddeninputcottondustcollection =  hiddeninputcottondustcollection;
            riskSpecificTextileGarmentSpinning.setCottondustcollection(mhiddeninputcottondustcollection);
            String mhiddeninputstock50feetstored =  hiddeninputstock50feetstored;
            riskSpecificTextileGarmentSpinning.setStock50feetstored(mhiddeninputstock50feetstored);
            String mhiddeninputinstalledspinningmills =  hiddeninputinstalledspinningmills;
            riskSpecificTextileGarmentSpinning.setInstalledspinningmills(mhiddeninputinstalledspinningmills);

            riskSpecificTextileGarmentSpinning.setRaForm(raForms);

            riskSpecificTextileGarmentSpinningService.add(riskSpecificTextileGarmentSpinning);

        }
        else if(mhiddeninputindustries.equals("Specific Information for Cotton Factory/Cotton Ginning/Pressing Factory")){

            RiskSpecificCottonGinning riskSpecificCottonGinning = new RiskSpecificCottonGinning();

            String mhiddeninputphutticottonstack50feetstored =  hiddeninputphutticottonstack50feetstored;
            riskSpecificCottonGinning.setStack50feetstored(mhiddeninputphutticottonstack50feetstored);
            String mhiddeninputcottonphuttistacked =  hiddeninputcottonphuttistacked;
            riskSpecificCottonGinning.setCottonphuttistacked(mhiddeninputcottonphuttistacked);
            String mhiddeninput2500FPIBcottonbalesstrored =  hiddeninput2500FPIBcottonbalesstrored;
            riskSpecificCottonGinning.setfPIB2500cottonbalesstrored(mhiddeninput2500FPIBcottonbalesstrored);
            String mhiddeninput1000FPIBcottonbalesstored =  hiddeninput1000FPIBcottonbalesstored;
            riskSpecificCottonGinning.setfPIB1000cottonbalesstored(mhiddeninput1000FPIBcottonbalesstored);
            String mhiddeninputmaximumheight6bales =  hiddeninputmaximumheight6bales;
            riskSpecificCottonGinning.setMaximumheight6bales(mhiddeninputmaximumheight6bales);
            String mhiddeninputstackdistance15feet =  hiddeninputstackdistance15feet;
            riskSpecificCottonGinning.setStackdistance15feet(mhiddeninputstackdistance15feet);
            String mhiddeninputlotsofbaledistance75feet =  hiddeninputlotsofbaledistance75feet;
            riskSpecificCottonGinning.setLotsofbaledistance75feet(mhiddeninputlotsofbaledistance75feet);
            String mhiddeninputcottonbalesdistance30feet =  hiddeninputcottonbalesdistance30feet;
            riskSpecificCottonGinning.setCottonbalesdistance30feet(mhiddeninputcottonbalesdistance30feet);
            String mhiddeninput10000FPIBcottonbalesstored =  hiddeninput10000FPIBcottonbalesstored;
            riskSpecificCottonGinning.setfPIB10000cottonbalesstoredlocation(mhiddeninput10000FPIBcottonbalesstored);
            String mhiddeninputstockstored50feet =  hiddeninputstockstored50feet;
            riskSpecificCottonGinning.setFuelstockstored50feet(mhiddeninputstockstored50feet);

            riskSpecificCottonGinning.setRaForm(raForms);

            riskSpecificCottonGinningService.add(riskSpecificCottonGinning);

        }
        else if (mhiddeninputindustries.equals("Specific Information for Oil & Feed Mills"))
        {
            RiskSpecificOilFeed riskSpecificOilFeed = new RiskSpecificOilFeed();


            String mhiddeninputcombustioncovered = hiddeninputcombustioncovered;
            riskSpecificOilFeed.setCombustioncovered(mhiddeninputcombustioncovered);
            String mhiddeninputcombustionsuminsuredpercent = hiddeninputcombustionsuminsuredpercent;
            riskSpecificOilFeed.setCombustionsuminsuredpercent(mhiddeninputcombustionsuminsuredpercent);
            String mhiddeninputnoofsilosatfactory = hiddeninputnoofsilosatfactory;
            riskSpecificOilFeed.setNoofsilosatfactory(mhiddeninputnoofsilosatfactory);
            String mhiddeninputseedstored = hiddeninputseedstored;
            riskSpecificOilFeed.setSeedstored(mhiddeninputseedstored);
            String mhiddeninputdistancestocks4feet = hiddeninputdistancestocks4feet;
            riskSpecificOilFeed.setDistancestocks4feet(mhiddeninputdistancestocks4feet);
            String mhiddeninputfirelanesmarked = hiddeninputfirelanesmarked;
            riskSpecificOilFeed.setFirelanesmarked(mhiddeninputfirelanesmarked);
            String mhiddeninputstackheight15feet = hiddeninputstackheight15feet;
            riskSpecificOilFeed.setStackheight15feet(mhiddeninputstackheight15feet);
            String mhiddeninput8000bagsstacked = hiddeninput8000bagsstacked;
            riskSpecificOilFeed.setBagsstacked8000(mhiddeninput8000bagsstacked);
            String mhiddeninputgodownsventilated = hiddeninputgodownsventilated;
            riskSpecificOilFeed.setGodownsventilated(mhiddeninputgodownsventilated);

            riskSpecificOilFeed.setRaForm(raForms);

            riskSpecificOilFeedService.add(riskSpecificOilFeed);

        }
        else if(mhiddeninputindustries.equals("Specific Information for Cosmetics/Chemical Factories/Labs"))
        {

            RiskSpecificCosmeticsChemical riskSpecificCosmeticsChemical = new RiskSpecificCosmeticsChemical();

            String mhiddeninputhazardouschemicalstored = hiddeninputhazardouschemicalstored;
            riskSpecificCosmeticsChemical.setHazardouschemicalstored(mhiddeninputhazardouschemicalstored);
            String mhiddeninputchemicalseparatestored = hiddeninputchemicalseparatestored;
            riskSpecificCosmeticsChemical.setChemicalseparatestored(mhiddeninputchemicalseparatestored);
            String mhiddeninputchemicalseparatestored30feet = hiddeninputchemicalseparatestored30feet;
            riskSpecificCosmeticsChemical.setChemicalseparatestored30feet(mhiddeninputchemicalseparatestored30feet);
            String mhiddeninputrawmaterialquantity = hiddeninputrawmaterialquantity;
            riskSpecificCosmeticsChemical.setRawmaterialquantity(mhiddeninputrawmaterialquantity);
            String mhiddeninputfireextinguishersprovided = hiddeninputfireextinguishersprovided;
            riskSpecificCosmeticsChemical.setFireextinguishersprovided(mhiddeninputfireextinguishersprovided);

            riskSpecificCosmeticsChemical.setRaForm(raForms);

            riskSpecificCosmeticsChemicalService.add(riskSpecificCosmeticsChemical);
        }
        else if(mhiddeninputindustries.equals("Specific Information for Livestock, Farms"))
        {
            RiskSpecificLiveStocksFarms riskSpecificLiveStocksFarms = new RiskSpecificLiveStocksFarms();

            String mhiddeninputanimalsvaccinated = hiddeninputanimalsvaccinated;
            riskSpecificLiveStocksFarms.setAnimalsvaccinated(mhiddeninputanimalsvaccinated);
            String mhiddeninputpestSprayCarriedOut = hiddeninputpestSprayCarriedOut;
            riskSpecificLiveStocksFarms.setPestSprayCarriedOut(mhiddeninputpestSprayCarriedOut);
            String mhiddeninputinsuredVeterinaryDoctor = hiddeninputinsuredVeterinaryDoctor;
            riskSpecificLiveStocksFarms.setInsuredVeterinaryDoctor(mhiddeninputinsuredVeterinaryDoctor);
            String mhiddeninputinhouseMedicalEmergency = hiddeninputinhouseMedicalEmergency;
            riskSpecificLiveStocksFarms.setInhouseMedicalEmergency(mhiddeninputinhouseMedicalEmergency);
            String mhiddeninputanimalsTagged = hiddeninputanimalsTagged;
            riskSpecificLiveStocksFarms.setAnimalsTagged(mhiddeninputanimalsTagged);
            String mhiddeninputdistanceBetweenAnimals = hiddeninputdistanceBetweenAnimals;
            riskSpecificLiveStocksFarms.setDistanceBetweenAnimals(mhiddeninputdistanceBetweenAnimals);
            String mhiddeninputanimalsEmergencyEvacuationMap = hiddeninputanimalsEmergencyEvacuationMap;
            riskSpecificLiveStocksFarms.setAnimalsEmergencyEvacuationMap(mhiddeninputanimalsEmergencyEvacuationMap);
            String mhiddeninputunauthorizedEntryInFarm = hiddeninputunauthorizedEntryInFarm;
            riskSpecificLiveStocksFarms.setUnauthorizedEntryInFarm(mhiddeninputunauthorizedEntryInFarm);
            String mhiddeninputwasteManagementFacility = hiddeninputwasteManagementFacility;
            riskSpecificLiveStocksFarms.setWasteManagementFacility(mhiddeninputwasteManagementFacility);
            String mhiddeninputsevereWeatherResistSheds = hiddeninputsevereWeatherResistSheds;
            riskSpecificLiveStocksFarms.setSevereWeatherResistSheds(mhiddeninputsevereWeatherResistSheds);

            riskSpecificLiveStocksFarms.setRaForm(raForms);

            riskSpecificLiveStocksFarmsService.add(riskSpecificLiveStocksFarms);

        }
        else if (mhiddeninputindustries.equals("Specific Information for Paper or Board Mills"))
        {

            RiskSpecificPaperBoard riskSpecificPaperBoard = new RiskSpecificPaperBoard();

            String mhiddeninputpaperstock4inchesheight = hiddeninputpaperstock4inchesheight;
            riskSpecificPaperBoard.setFourInchesHeight(mhiddeninputpaperstock4inchesheight);
            String mhiddeninputpaperstock4inchesaway = hiddeninputpaperstock4inchesaway;
            riskSpecificPaperBoard.setFourInchesAway(mhiddeninputpaperstock4inchesaway);
            String mhiddeninputpaperstockstoredopen = hiddeninputpaperstockstoredopen;
            riskSpecificPaperBoard.setStoredopen(mhiddeninputpaperstockstoredopen);
            String mhiddeninputpaperstackefeetbelow = hiddeninputpaperstackefeetbelow;
            riskSpecificPaperBoard.setStocksThreeFeetBelowCeiling(mhiddeninputpaperstackefeetbelow);
            String mhiddeninputpapergodownselectrified = hiddeninputpapergodownselectrified;
            riskSpecificPaperBoard.setGodownselectrified(mhiddeninputpapergodownselectrified);

            riskSpecificPaperBoard.setRaForm(raForms);

            riskSpecificPaperBoardService.add(riskSpecificPaperBoard);
        }

        Surveyors surveyors = surveyorsService.findByUserName(raForms.getAssignedToName());

        rcsLog.setUsers(raForms.getUsers());
        rcsLog.setLogDate(sqlCurrentDate);
        rcsLog.setRaForm(raForms);
        rcsLog.setRAFormNo(raForms.getRaFormNo());
        rcsLog.setLogAction("RAForm filled by Surveyors" + surveyors.getSurveyorName());
        rcsLog.setSessionUser(retrieveLoggedinUserName());
        rcsLog.setUserType("Surveyors");

        rcsLogService.add(rcsLog);

        String RAFNo = raForms.getRaFormNo();
        String cuser = users.getName();
        String companyName = raForms.getInsuredName();

        mailMail.sendMailToRI("rcs.ublinusrers@gmail.com", sessionUser.getEmail(), "Risk location surveyed (Above 500 million) by surveyor " + RAFNo, "\n" + "Dear Team,\n\n" + "RAF No" + RAFNo + " has been initiate by " + cuser + companyName +" Company has been surveyed. RFA form is available in the portal for your reference. " + "\n\n\n" + "Please review and revert us accordingly."+"\n\n"+"Best regards,");


        return "redirect:/surveyor/supportingReport/"+rafId;
    }

    @RequestMapping(value = { "/supportingReport/{id}" }, method = RequestMethod.GET)
    public String supportingReportsList(@PathVariable int id, Model model){

        RAForms raForms = raFormsService.findById(id);

        FileBucket fileModel = new FileBucket();
        model.addAttribute("fileBucket", fileModel);
        model.addAttribute("raForms", raForms);

        List<LocationReports> locationReportsList = locationReportsService.findByRAForms(id);
        model.addAttribute("locationReportsList", locationReportsList);

        return "Surveyor/docUpload";
    }

    @RequestMapping(value = { "/download/{id}/{docId}" }, method = RequestMethod.GET)
    public String downloadSupportingReports(@PathVariable int id, @PathVariable int docId, HttpServletResponse response) throws IOException {
        RAForms raForms = raFormsService.findById(id);
        LocationReports locationReports = locationReportsService.findById(docId);
        response.setContentType(locationReports.getType());
        response.setContentLength(locationReports.getContent().length);
        response.setHeader("Content-Disposition","attachment; filename=\"" + locationReports.getName() +"\"");

        java.util.Date date = new Date();
        java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());
        Users users = usersService.findUserByName(retrieveLoggedinUserName());
        Surveyors surveyors = surveyorsService.findByUserName(raForms.getAssignedToName());
        RCSLog rcsLog = new RCSLog();

        rcsLog.setUsers(raForms.getUsers());
        rcsLog.setLogDate(sqlCurrentDate);
        rcsLog.setRaForm(raForms);
        rcsLog.setRAFormNo(raForms.getRaFormNo());
        rcsLog.setLogAction("Report download Activity by Surveyors" + surveyors.getSurveyorName());
        rcsLog.setSessionUser(retrieveLoggedinUserName());
        rcsLog.setUserType("Surveyors");

        rcsLogService.add(rcsLog);

        FileCopyUtils.copy(locationReports.getContent(), response.getOutputStream());

        return "redirect:/surveyor/supportingReport/"+id;
    }

    @RequestMapping(value = { "/delete/{id}/{docId}" }, method = RequestMethod.GET)
    public String deleteSupportingReports(@PathVariable int id, @PathVariable int docId) {

        java.util.Date date = new Date();
        java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());
        LocationReports locationReports = locationReportsService.findById(docId);
        RAForms raForms = raFormsService.findById(id);
        Users users = usersService.findUserByName(retrieveLoggedinUserName());
        Surveyors surveyors = surveyorsService.findByUserName(raForms.getAssignedToName());
        RCSLog rcsLog = new RCSLog();

        rcsLog.setUsers(raForms.getUsers());
        rcsLog.setLogDate(sqlCurrentDate);
        rcsLog.setRaForm(raForms);
        rcsLog.setRAFormNo(raForms.getRaFormNo());
        rcsLog.setLogAction("Report delete Activity by Surveyors" + surveyors.getSurveyorName());
        rcsLog.setSessionUser(retrieveLoggedinUserName());
        rcsLog.setUserType("Surveyors");

        rcsLogService.add(rcsLog);

        locationReportsService.delete(locationReports);
        return "redirect:/surveyor/supportingReport/"+id;
    }

    @RequestMapping(value = { "/supportingReport/{id}" }, method = RequestMethod.POST)
    public String uploadSupportingReports(@Valid FileBucket fileBucket, BindingResult result, Model model, @PathVariable int id, HttpServletRequest request) throws IOException, InvalidFormatException {

        if (result.hasErrors()) {
            System.out.println("validation errors");

            RAForms raForms = raFormsService.findById(id);
            model.addAttribute("raForms", raForms);

            List<LocationReports> locationReportsList = locationReportsService.findByRAForms(id);
            model.addAttribute("locationReportsList", locationReportsList);

            return "Surveyor/docUpload";
        } else {

            System.out.println("Fetching file");

            java.util.Date date = new Date();
            java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());

            RAForms raForms = raFormsService.findById(id);
            model.addAttribute("raForms", raForms);

            saveSupportingReports(fileBucket, raForms);

            Users users = usersService.findUserByName(retrieveLoggedinUserName());
            Surveyors surveyors = surveyorsService.findByUserName(raForms.getAssignedToName());
            RCSLog rcsLog = new RCSLog();

            rcsLog.setUsers(raForms.getUsers());
            rcsLog.setLogDate(sqlCurrentDate);
            rcsLog.setRaForm(raForms);
            rcsLog.setRAFormNo(raForms.getRaFormNo());
            rcsLog.setLogAction("Report upload Activity by Surveyors "+surveyors.getSurveyorName());
            rcsLog.setSessionUser(retrieveLoggedinUserName());
            rcsLog.setUserType("Surveyors");

            rcsLogService.add(rcsLog);

            return "redirect:/surveyor/supportingReport/"+id;
        }
    }

    private void saveSupportingReports(FileBucket fileBucket, RAForms raForms) throws IOException {

        LocationReports locationReports = new LocationReports();
        MultipartFile multipartFile = fileBucket.getFile();

        locationReports.setName(multipartFile.getOriginalFilename());
        locationReports.setType(multipartFile.getContentType());
        locationReports.setDescription(fileBucket.getDescription());
        locationReports.setContent(multipartFile.getBytes());
        locationReports.setRaForm(raForms);
        locationReportsService.add(locationReports);

    }


    @RequestMapping(value = { "/inspectedPic/{id}" }, method = RequestMethod.GET)
    public String inspectedPicList(@PathVariable int id, Model model){

        RAForms raForms = raFormsService.findById(id);

        FileBucket fileModel = new FileBucket();
        model.addAttribute("fileBucket", fileModel);
        model.addAttribute("raForms", raForms);

        List<LocationInspectionPics> locationInspectionPicsList = locationInspectionPicService.findByRAForms(id);
        model.addAttribute("locationInspectionPicsList", locationInspectionPicsList);

        return "Surveyor/snapUpload";
    }

    @RequestMapping(value = { "/inspectedPic/download/{id}/{picId}" }, method = RequestMethod.GET)
    public String downloadInspectedPic(@PathVariable int id, @PathVariable int picId, HttpServletResponse response) throws IOException {
        RAForms raForms = raFormsService.findById(id);
        LocationInspectionPics locationInspectionPics = locationInspectionPicService.findById(picId);
        response.setContentType(locationInspectionPics.getType());
        response.setContentLength(locationInspectionPics.getContent().length);
        response.setHeader("Content-Disposition","attachment; filename=\"" + locationInspectionPics.getName() +"\"");

        java.util.Date date = new Date();
        java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());
        Users users = usersService.findUserByName(retrieveLoggedinUserName());
        Surveyors surveyors = surveyorsService.findByUserName(raForms.getAssignedToName());
        RCSLog rcsLog = new RCSLog();

        rcsLog.setUsers(raForms.getUsers());
        rcsLog.setLogDate(sqlCurrentDate);
        rcsLog.setRaForm(raForms);
        rcsLog.setRAFormNo(raForms.getRaFormNo());
        rcsLog.setLogAction("Inspection Pic download Activity by Surveyors "+surveyors.getSurveyorName());
        rcsLog.setSessionUser(retrieveLoggedinUserName());
        rcsLog.setUserType("Surveyors");

        rcsLogService.add(rcsLog);

        FileCopyUtils.copy(locationInspectionPics.getContent(), response.getOutputStream());

        return "redirect:/surveyor/inspectedPic/"+id;
    }

    @RequestMapping(value = { "/inspectedPic/delete/{id}/{picId}" }, method = RequestMethod.GET)
    public String deleteInspectedPic(@PathVariable int id, @PathVariable int picId) {

        java.util.Date date = new Date();
        java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());
        LocationInspectionPics locationInspectionPics = locationInspectionPicService.findById(picId);
        RAForms raForms = raFormsService.findById(id);
        Users users = usersService.findUserByName(retrieveLoggedinUserName());
        Surveyors surveyors = surveyorsService.findByUserName(raForms.getAssignedToName());
        RCSLog rcsLog = new RCSLog();

        rcsLog.setUsers(raForms.getUsers());
        rcsLog.setLogDate(sqlCurrentDate);
        rcsLog.setRaForm(raForms);
        rcsLog.setRAFormNo(raForms.getRaFormNo());
        rcsLog.setLogAction("Inspected pic delete Activity by Surveyors "+surveyors.getSurveyorName());
        rcsLog.setSessionUser(retrieveLoggedinUserName());
        rcsLog.setUserType("Surveyors");

        rcsLogService.add(rcsLog);

        locationInspectionPicService.delete(locationInspectionPics);
        return "redirect:/surveyor/inspectedPic/"+id;
    }

    @RequestMapping(value = { "/inspectedPic/{id}" }, method = RequestMethod.POST)
    public String uploadInspectedPic(@Valid FileBucket fileBucket, BindingResult result, Model model, @PathVariable int id, HttpServletRequest request) throws IOException, InvalidFormatException {

        if (result.hasErrors()) {
            System.out.println("validation errors");

            RAForms raForms = raFormsService.findById(id);
            model.addAttribute("raForms", raForms);

            List<LocationInspectionPics> locationInspectionPicsList = locationInspectionPicService.findByRAForms(id);
            model.addAttribute("locationInspectionPicsList", locationInspectionPicsList);

            return "Surveyor/snapUpload";
        } else {

            System.out.println("Fetching file");

            java.util.Date date = new Date();
            java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());

            RAForms raForms = raFormsService.findById(id);
            model.addAttribute("raForms", raForms);

            saveInspectedPic(fileBucket, raForms);

            Users users = usersService.findUserByName(retrieveLoggedinUserName());
            Surveyors surveyors = surveyorsService.findByUserName(raForms.getAssignedToName());
            RCSLog rcsLog = new RCSLog();

            rcsLog.setUsers(raForms.getUsers());
            rcsLog.setLogDate(sqlCurrentDate);
            rcsLog.setRaForm(raForms);
            rcsLog.setRAFormNo(raForms.getRaFormNo());
            rcsLog.setLogAction("Inspected pic upload Activity by Surveyors "+surveyors.getSurveyorName());
            rcsLog.setSessionUser(retrieveLoggedinUserName());
            rcsLog.setUserType("Surveyors");

            rcsLogService.add(rcsLog);

            return "redirect:/surveyor/inspectedPic/"+id;
        }
    }

    private void saveInspectedPic(FileBucket fileBucket, RAForms raForms) throws IOException {

        LocationInspectionPics locationInspectionPics = new LocationInspectionPics();
        MultipartFile multipartFile = fileBucket.getFile();

        locationInspectionPics.setName(multipartFile.getOriginalFilename());
        locationInspectionPics.setType(multipartFile.getContentType());
        locationInspectionPics.setDescription(fileBucket.getDescription());
        locationInspectionPics.setContent(multipartFile.getBytes());
        locationInspectionPics.setRaForm(raForms);
        locationInspectionPicService.add(locationInspectionPics);

    }


    @RequestMapping(value = { "/summary/{id}" }, method = RequestMethod.GET)
    public String summary(@PathVariable(value = "id") int id,Model model){
        RAForms raForms = raFormsService.findById(id);

        if (raForms.getWaiver().equals("Yes waive")){

            RiskLocations riskLocationswithwaiver = riskLocationService.findById(raForms.getRiskLocations().getRiskLocationId());
            List<LocationInspectionPics> locationInspectionPicsList = locationInspectionPicService.findByRAForms(raForms.getRaFormId());
            List<LocationReports>  locationReportsList = locationReportsService.findByRAForms(raForms.getRaFormId());


            model.addAttribute("raForms", raForms);
            model.addAttribute("riskLocationswithwaiver", riskLocationswithwaiver);
            model.addAttribute("locationInspectionPicsList", locationInspectionPicsList);
            model.addAttribute("locationReportsList", locationReportsList);
        }
        else if (raForms.getWaiver().equals("No waive")){

            RiskLocations riskLocationswithoutwaiver = riskLocationService.findById(raForms.getRiskLocations().getRiskLocationId());

            if (raForms.getIndustryType().equals("Specific Information for Textile/Garment Factory/Spinning Mills/Weaving Mills"))
            {
                RiskSpecificTextileGarmentSpinning riskSpecificTextileGarmentSpinning = riskSpecificTextileGarmentSpinningService.findByRAForm(raForms.getRaFormId());
                model.addAttribute("riskSpecificTextileGarmentSpinning", riskSpecificTextileGarmentSpinning);
            }
            else if (raForms.getIndustryType().equals("Specific Information for Cotton Factory/Cotton Ginning/Pressing Factory"))
            {
                RiskSpecificCottonGinning riskSpecificCottonGinning = riskSpecificCottonGinningService.findByRAForm(raForms.getRaFormId());
                model.addAttribute("riskSpecificCottonGinning", riskSpecificCottonGinning);
            }
            else if (raForms.getIndustryType().equals("Specific Information for Oil & Feed Mills"))
            {
                RiskSpecificOilFeed riskSpecificOilFeed = riskSpecificOilFeedService.findByRAForm(raForms.getRaFormId());
                model.addAttribute("riskSpecificOilFeed", riskSpecificOilFeed);
            }
            else if(raForms.getIndustryType().equals("Specific Information for Cosmetics/Chemical Factories/Labs"))
            {
                RiskSpecificCosmeticsChemical riskSpecificCosmeticsChemical = riskSpecificCosmeticsChemicalService.findByRAForm(raForms.getRaFormId());
                model.addAttribute("riskSpecificCosmeticsChemical", riskSpecificCosmeticsChemical);
            }
            else if(raForms.getIndustryType().equals("Specific Information for Livestock, Farms"))
            {
                RiskSpecificLiveStocksFarms riskSpecificLiveStocksFarms = riskSpecificLiveStocksFarmsService.findByRAForm(raForms.getRaFormId());
                model.addAttribute("riskSpecificLiveStocksFarms", riskSpecificLiveStocksFarms);
            }
            else
            {
                RiskSpecificPaperBoard riskSpecificPaperBoard = riskSpecificPaperBoardService.findByRAForm(raForms.getRaFormId());
                model.addAttribute("riskSpecificPaperBoard", riskSpecificPaperBoard);
            }


            List<LocationInspectionPics> locationInspectionPicsList = locationInspectionPicService.findByRAForms(raForms.getRaFormId());
            List<LocationReports>  locationReportsList = locationReportsService.findByRAForms(raForms.getRaFormId());


            model.addAttribute("raForms", raForms);
            model.addAttribute("riskLocationswithoutwaiver", riskLocationswithoutwaiver);
            model.addAttribute("locationInspectionPicsList", locationInspectionPicsList);
            model.addAttribute("locationReportsList", locationReportsList);
        }

        return "Surveyor/RMSSummaryView";

    }

    @RequestMapping(value = { "/briefSummary/{id}" }, method = RequestMethod.GET)
    public String briefSummary(@PathVariable(value = "id") int id,Model model){
        RAForms raForms = raFormsService.findById(id);

        if (raForms.getWaiver().equals("Yes waive")){

            RiskLocations riskLocationswithwaiver = riskLocationService.findById(raForms.getRiskLocations().getRiskLocationId());
            List<LocationInspectionPics> locationInspectionPicsList = locationInspectionPicService.findByRAForms(raForms.getRaFormId());
            List<LocationReports>  locationReportsList = locationReportsService.findByRAForms(raForms.getRaFormId());


            model.addAttribute("raForms", raForms);
            model.addAttribute("riskLocationswithwaiver", riskLocationswithwaiver);
            model.addAttribute("locationInspectionPicsList", locationInspectionPicsList);
            model.addAttribute("locationReportsList", locationReportsList);
        }
        else if (raForms.getWaiver().equals("No waive")){

            RiskLocations riskLocationswithoutwaiver = riskLocationService.findById(raForms.getRiskLocations().getRiskLocationId());

            if (raForms.getIndustryType().equals("Specific Information for Textile/Garment Factory/Spinning Mills/Weaving Mills"))
            {
                RiskSpecificTextileGarmentSpinning riskSpecificTextileGarmentSpinning = riskSpecificTextileGarmentSpinningService.findByRAForm(raForms.getRaFormId());
                model.addAttribute("riskSpecificTextileGarmentSpinning", riskSpecificTextileGarmentSpinning);
            }
            else if (raForms.getIndustryType().equals("Specific Information for Cotton Factory/Cotton Ginning/Pressing Factory"))
            {
                RiskSpecificCottonGinning riskSpecificCottonGinning = riskSpecificCottonGinningService.findByRAForm(raForms.getRaFormId());
                model.addAttribute("riskSpecificCottonGinning", riskSpecificCottonGinning);
            }
            else if (raForms.getIndustryType().equals("Specific Information for Oil & Feed Mills"))
            {
                RiskSpecificOilFeed riskSpecificOilFeed = riskSpecificOilFeedService.findByRAForm(raForms.getRaFormId());
                model.addAttribute("riskSpecificOilFeed", riskSpecificOilFeed);
            }
            else if(raForms.getIndustryType().equals("Specific Information for Cosmetics/Chemical Factories/Labs"))
            {
                RiskSpecificCosmeticsChemical riskSpecificCosmeticsChemical = riskSpecificCosmeticsChemicalService.findByRAForm(raForms.getRaFormId());
                model.addAttribute("riskSpecificCosmeticsChemical", riskSpecificCosmeticsChemical);
            }
            else if(raForms.getIndustryType().equals("Specific Information for Livestock, Farms"))
            {
                RiskSpecificLiveStocksFarms riskSpecificLiveStocksFarms = riskSpecificLiveStocksFarmsService.findByRAForm(raForms.getRaFormId());
                model.addAttribute("riskSpecificLiveStocksFarms", riskSpecificLiveStocksFarms);
            }
            else
            {
                RiskSpecificPaperBoard riskSpecificPaperBoard = riskSpecificPaperBoardService.findByRAForm(raForms.getRaFormId());
                model.addAttribute("riskSpecificPaperBoard", riskSpecificPaperBoard);
            }


            List<LocationInspectionPics> locationInspectionPicsList = locationInspectionPicService.findByRAForms(raForms.getRaFormId());
            List<LocationReports>  locationReportsList = locationReportsService.findByRAForms(raForms.getRaFormId());


            model.addAttribute("raForms", raForms);
            model.addAttribute("riskLocationswithoutwaiver", riskLocationswithoutwaiver);
            model.addAttribute("locationInspectionPicsList", locationInspectionPicsList);
            model.addAttribute("locationReportsList", locationReportsList);
        }



        return "Surveyor/RMSBriefSummary";

    }

    @RequestMapping("/finalSubmission/{raFormId}")
    public String finalSubmission(@PathVariable int raFormId,Model model){

        java.util.Date date = new Date();
        java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());
        RAForms raForms = raFormsService.findById(raFormId);

        raForms.setStatus("Waiting for Evaluation");

        raFormsService.edit(raForms);

        Surveyors surveyors = surveyorsService.findByUserName(raForms.getAssignedToName());

        RCSLog rcsLog = new RCSLog();

        rcsLog.setUsers(raForms.getUsers());
        rcsLog.setLogDate(sqlCurrentDate);
        rcsLog.setRaForm(raForms);
        rcsLog.setRAFormNo(raForms.getRaFormNo());
        rcsLog.setLogAction("RAForm final Submission by Surveyors" + surveyors.getSurveyorName());
        rcsLog.setSessionUser(retrieveLoggedinUserName());
        rcsLog.setUserType("Surveyors");

        rcsLogService.add(rcsLog);

       /* String kyc = clients.getKYCNo();
        String cuser = users.getName();

        mailMail.sendMailToRI("aml.cftdepartment@gmail.com","mathew.joel@ublinsurers.com","KYC Initiate KYC No "+kyc,"\n"+"Dear concern,\n\n" + "KYC No"+kyc+" has been initiate by "+cuser+".\n\n" +"Thanks & Regards,\n\n" + "UBL Insurers Team.\n\n\n"+"This is system generated document, do not required any signature or stamp. ");
        mailMail.sendMailToRI("aml.cftdepartment@gmail.com","mohammad.r@ublinsurers.com","KYC Initiate KYC No "+kyc,"\n"+"Dear concern,\n\n" + "KYC No"+kyc+" has been initiate by "+cuser+".\n\n" +"Thanks & Regards,\n\n" + "UBL Insurers Team.\n\n\n"+"This is system generated document, do not required any signature or stamp. ");
        mailMail.sendMailToRI("aml.cftdepartment@gmail.com","zain.shakeel@ublinsurers.com","KYC Initiate KYC No "+kyc,"\n"+"Dear concern,\n\n" + "KYC No"+kyc+" has been initiate by "+cuser+".\n\n" +"Thanks & Regards,\n\n" + "UBL Insurers Team.\n\n\n"+"This is system generated document, do not required any signature or stamp. ");
        mailMail.sendMailToRI("aml.cftdepartment@gmail.com","naresh.kumar@ublinsurers.com","KYC Initiate KYC No "+kyc,"\n"+"Dear concern,\n\n" + "KYC No"+kyc+" has been initiate by "+cuser+".\n\n" +"Thanks & Regards,\n\n" + "UBL Insurers Team.\n\n\n"+"This is system generated document, do not required any signature or stamp. ");
*/
        return "redirect:/surveyor/riskLocations";
    }

    @ModelAttribute("AllIndustryTypeSpecific")
    public List<Options> populateInsdustrySpecificList() {
        List<Options> industries = CustomList.populateInsdustrySpecificList();
        return industries;
    }
    @RequestMapping(value="/getImage",method = RequestMethod.GET)
    public void getUserImage(HttpServletResponse response, HttpServletRequest request , @RequestParam("id") int id) throws ServletException, IOException{


        LocationInspectionPics locationInspectionPics = locationInspectionPicService.findById(id);

        response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        response.getOutputStream().write(locationInspectionPics.getContent());


        response.getOutputStream().close();
        // response.setContentType("image/jpeg, image/jpg, image/png");
        //response.setContentLength(vehicleImages.getImage().length);
        // response.getOutputStream().write(vehicleImages.getImage());
        // InputStream in1 = new ByteArrayInputStream(buffer);
        // IOUtils.copy(in1, response.getOutputStream());
        // response.getOutputStream().close();
    }



/*    @ModelAttribute("AllSurveyors")
    public List<Surveyors> populateAllSurveyorsList() {
        List<Surveyors> surveyorsList = surveyorsService.findAll();
        return surveyorsList;
    }

    @ModelAttribute("AllRMTeam")
    public List<Users> populateAllRMTeamList() {
        List<Users> usersList = usersService.findAllUsersRMTeams(3);
        return usersList;
    }*/

    private String retrieveLoggedinUserName() {
        Object principal = SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();

        if (principal instanceof UserDetails)
            return ((UserDetails) principal).getUsername();

        return principal.toString();
    }


}

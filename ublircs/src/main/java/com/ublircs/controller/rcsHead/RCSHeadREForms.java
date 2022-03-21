package com.ublircs.controller.rcsHead;

import com.ublircs.model.*;
import com.ublircs.service.*;
import com.ublircs.util.MailMail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Controller
@RequestMapping("/rcsHead")
public class RCSHeadREForms {

    @Autowired
    RAFormsService raFormsService;

    @Autowired
    private MailMail mailMail;

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

    @RequestMapping(value = { "/supportingReport/{id}" }, method = RequestMethod.GET)
    public String supportingReportsList(@PathVariable int id, Model model){

        RAForms raForms = raFormsService.findById(id);

        FileBucket fileModel = new FileBucket();
        model.addAttribute("fileBucket", fileModel);
        model.addAttribute("raForms", raForms);

        List<LocationReports> locationReportsList = locationReportsService.findByRAForms(id);
        model.addAttribute("locationReportsList", locationReportsList);

        return "RMSHead/docUpload";
    }

    @RequestMapping(value = { "/waiver/{id}" }, method = RequestMethod.GET)
    public String waiver(@PathVariable int id,@RequestParam("waiverReason") String waiverReason, Model model){

        RAForms raForms = raFormsService.findById(id);

        raForms.setWaiverReason(waiverReason);
        raForms.setStatus("Waived");

        raFormsService.edit(raForms);

        return "redirect:/rcsHead/riskLocations";
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
        Branches branches = branchesService.findById(users.getBranches().getBranchId());
        RCSLog rcsLog = new RCSLog();

        rcsLog.setUsers(raForms.getUsers());
        rcsLog.setLogDate(sqlCurrentDate);
        rcsLog.setRaForm(raForms);
        rcsLog.setRAFormNo(raForms.getRaFormNo());
        rcsLog.setLogAction("Report download Activity by RM Team head"+users.getName());
        rcsLog.setSessionUser(retrieveLoggedinUserName());
        rcsLog.setUserType("RMS Team");

        rcsLogService.add(rcsLog);

        FileCopyUtils.copy(locationReports.getContent(), response.getOutputStream());

        return "redirect:/rcsHead/supportingReport/"+id;
    }

    @RequestMapping("/evaluate/{id}")
    public String evaluationHeadRMD(@PathVariable("id") int id, Model model){
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


        return "RMSHead/REForm";
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



        return "RMSHead/RMSBriefSummary";

    }

    @RequestMapping(value = "/evaluate/getREForm",method = RequestMethod.GET)
    public String getREForm(
            @RequestParam("rafId") int rafId,
            @RequestParam("hiddeninputzerototenOne") String hiddeninputzerototenOne,
            @RequestParam("hiddeninputzerototenTwo") String hiddeninputzerototenTwo,
            @RequestParam("hiddeninputzerototenThree") String hiddeninputzerototenThree,
            @RequestParam("hiddeninputzerototenFour") String hiddeninputzerototenFour,
            @RequestParam("hiddeninputzerototenFive") String hiddeninputzerototenFive,
            @RequestParam("hiddeninputzerototenSix") String hiddeninputzerototenSix,
            @RequestParam("hiddeninputzerototenSeven") String hiddeninputzerototenSeven,
            @RequestParam("hiddeninputzerototenEight") String hiddeninputzerototenEight,
            @RequestParam("hiddeninputzerototenNine") String hiddeninputzerototenNine,
            @RequestParam("hiddeninputzerototenTen") String hiddeninputzerototenTen,
            @RequestParam("hiddeninputsum") String hiddeninputsum,
            @RequestParam("hiddeninputriskScale") String hiddeninputriskScale,
            @RequestParam("hiddeninputriskRanking") String hiddeninputriskRanking,
            Model model){

        RAForms raForms = raFormsService.findById(rafId);
        Users sessionUser = usersService.findUserByName(retrieveLoggedinUserName());

        String mhiddeninputzerototenOne = hiddeninputzerototenOne;
        raForms.setRefBuildings(Byte.parseByte(mhiddeninputzerototenOne));
        String mhiddeninputzerototenTwo = hiddeninputzerototenTwo;
        raForms.setRefPartitioning(Byte.parseByte(mhiddeninputzerototenTwo));
        String mhiddeninputzerototenThree = hiddeninputzerototenThree;
        raForms.setRefProcessHazards(Byte.parseByte(mhiddeninputzerototenThree));
        String mhiddeninputzerototenFour = hiddeninputzerototenFour;
        raForms.setRefPlantMachinery(Byte.parseByte(mhiddeninputzerototenFour));
        String mhiddeninputzerototenFive = hiddeninputzerototenFive;
        raForms.setRefStocks(Byte.parseByte(mhiddeninputzerototenFive));
        String mhiddeninputzerototenSix = hiddeninputzerototenSix;
        raForms.setRefElectrifications(Byte.parseByte(mhiddeninputzerototenSix));
        String mhiddeninputzerototenSeven = hiddeninputzerototenSeven;
        raForms.setRefHousekeeping(Byte.parseByte(mhiddeninputzerototenSeven));
        String mhiddeninputzerototenEight = hiddeninputzerototenEight;
        raForms.setRefFirefighting(Byte.parseByte(mhiddeninputzerototenEight));
        String mhiddeninputzerototenNine = hiddeninputzerototenNine;
        raForms.setRefPostFireArrangements(Byte.parseByte(mhiddeninputzerototenNine));
        String mhiddeninputzerototenTen = hiddeninputzerototenTen;
        raForms.setRefSecurityArrangements(Byte.parseByte(mhiddeninputzerototenTen));
        String mhiddeninputsum = hiddeninputsum;
        raForms.setTotalRiskFactors(Byte.parseByte(mhiddeninputsum));
        String mhiddeninputriskScale = hiddeninputriskScale;
        raForms.setRanks(mhiddeninputriskScale);
        String mhiddeninputriskRanking = hiddeninputriskRanking;
        raForms.setOverAllRanking(mhiddeninputriskRanking);
        raForms.setStatus("Evaluation Complete");


        raFormsService.edit(raForms);

        String RAFNo = raForms.getRaFormNo();
        String overallranking = raForms.getOverAllRanking();

        mailMail.sendMailToRI("rcs.ublinusrers@gmail.com", sessionUser.getEmail(), "Risk ranking of RAF No# "+RAFNo , "\n" + "Dear Concern,\n\n" + "RAF No# " + RAFNo + " risk ranking is stands here " + overallranking + "\n\n\n" + "This is an automated email. Please do not reply to it."+"\n\n"+"Best regards,");


        return "redirect:/rcsHead/riskLocations";

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

    private String retrieveLoggedinUserName() {
        Object principal = SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();

        if (principal instanceof UserDetails)
            return ((UserDetails) principal).getUsername();

        return principal.toString();
    }

}

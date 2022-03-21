package com.ublircs.controller.rcsTeam;

import com.ublircs.model.*;
import com.ublircs.service.*;
import com.ublircs.util.CustomList;
import com.ublircs.util.MailMail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Controller
@RequestMapping("/rcsTeam")
@SessionAttributes("name")
public class RCSTeamHome {

    @Autowired
    RAFormsService raFormsService;

    @Autowired
    UsersService usersService;

    @Autowired
    SurveyorsService surveyorsService;

    @Autowired
    BranchesService branchesService;

    @Autowired
    UserTypesService userTypesService;

    @Autowired
    RCSLogService rcsLogService;

    @Autowired
    private MailMail mailMail;

    @RequestMapping("/home")
    public String home(Model model){

        List<RAForms> raFormsList = raFormsService.findAll();

        model.addAttribute("raFormsList", raFormsList);

        return "RMSTeam/riskLocationGrid";
    }

    @RequestMapping("/riskLocations")
    public String risklocations(Model model){

        List<RAForms> raFormsList = raFormsService.findAll();

        model.addAttribute("raFormsList", raFormsList);

        return "RMSTeam/riskLocationGrid";
    }

    @RequestMapping("/AssignedRisk")
    public String assignedRisk(Model model){

        Users users = usersService.findUserByName(retrieveLoggedinUserName());

        List<RAForms> raFormsList = raFormsService.findAllByAssignTo(users.getUserName());

        model.addAttribute("raFormsList", raFormsList);

        return "RMSTeam/assignedRiskGrid";
    }

    /* User creation edition mode start */

    @RequestMapping("/home/users")
    public String homeUsers(Model model) {
        List<Users> users = usersService.findAllUsers();
        model.addAttribute("users", users);

        return "RMSTeam/users/userGrid";
    }

    @RequestMapping("/users")
    public String usersInventory(Model model) {
        List<Users> users = usersService.findAllUsers();
        model.addAttribute("users", users);

        return "RMSTeam/users/userGrid";
    }

    @RequestMapping("/users/add")
    public String addUser(Model model) {
        Users users = new Users();
        Branches branches = new Branches();
        users.setBranches(branches);

        UserTypes userTypes = new UserTypes();
        users.setUserTypes(userTypes);

        model.addAttribute("users", users);

        return "RMSTeam/users/addUser";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUserPost(@Valid @ModelAttribute("users") Users users, BindingResult result, HttpServletRequest request, Model model) {

        if (result.hasErrors()) {
            return "RMSTeam/users/addUser";
        }

        List<Users> userList = usersService.findAllUsers();

        for (int i = 0; i < userList.size(); i++) {

            if (users.getUserName().equals(userList.get(i).getUserName())) {
                model.addAttribute("usernameMsg", "User Name already exists");

                return "RMSTeam/users/addUser";
            }
            if (users.getEmail().equals(userList.get(i).getEmail())) {
                model.addAttribute("emailMsg", "Email already exists");

                return "RMSTeam/users/addUser";
            }
        }


        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        users.setPassword(encoder.encode("uil@123"));

        Date date = new Date();
        java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());

        users.setCreated(sqlCurrentDate);

        users.setStatus(true);
        users.setRestPassword(false);

        setUserBranch(users.getUserTypes().getUserTypeId(), users);

        usersService.add(users);
        Users sessionUser = usersService.findUserByName(retrieveLoggedinUserName());
        RCSLog rcsLog = new RCSLog();
            Branches branchName = branchesService.findById(users.getBranches().getBranchId());
        UserTypes userType = userTypesService.findById(users.getUserTypes().getUserTypeId());

        rcsLog.setUsers(users);
        rcsLog.setSessionUser(sessionUser.getUserName());
        rcsLog.setUserType(sessionUser.getUserTypes().getUsertype());
        rcsLog.setLogDate(sqlCurrentDate);
        if (users.getUserTypes().getUserTypeId() == 2) {
            rcsLog.setLogAction("RMS Team " + sessionUser.getUserName() + " added " + users.getUserName() + " as a " + userType.getUsertype() + " in " + branchName.getBranchName());
        } else if (users.getUserTypes().getUserTypeId() == 3) {
            rcsLog.setLogAction("RMS Team " + sessionUser.getUserName() + " added " + users.getUserName() + " as a " + userType.getUsertype() + " in Compliance Dept");
        } else if (users.getUserTypes().getUserTypeId() == 4) {
            rcsLog.setLogAction("RMS Team " + sessionUser.getUserName() + " added " + users.getUserName() + " as a " + userType.getUsertype() + " in " + branchName.getBranchName());
        }
        rcsLogService.add(rcsLog);

        String name = users.getName();
        String userName = users.getUserName();
        String email = users.getEmail();
       mailMail.sendMailToRI("rcs.ublinusrers@gmail.com", email, name, "Dear" + " " + name + "\n" + "\n" + "\n" + "Your account has been created successfully.\n\n" + "Your User Credentials are given below.\n\n" + "User Name = " + userName + "\n" + "Password = uil@123" + "\n\n" + "http:://ublionline.com/ublircs/login");

        return "redirect:/rcsTeam/users";

    }

    @RequestMapping("/users/edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model) {
        Users users = usersService.findById(id);

        model.addAttribute("users", users);

        return "RMSTeam/users/editUser";
    }

    @RequestMapping(value = "/users/edit", method = RequestMethod.POST)
    public String editUserPost(@Valid @ModelAttribute("users") Users users, BindingResult result, HttpServletRequest request, HttpServletResponse response) {

        if (result.hasErrors()) {

            return "RMSTeam/users/editUser";
        }

        Date date = new Date();
        java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());

        java.sql.Date creationData = users.getCreated();
        users.setCreated(users.getCreated());
        users.setModified(sqlCurrentDate);

        setUserBranch(users.getUserTypes().getUserTypeId(), users);
        String currentstatus = request.getParameter("currentstatus");
        String afterStatus = request.getParameter("afterStatus");

        String currentUserType = request.getParameter("currentusertype");
        String tusertype = request.getParameter("tusertype");

        String currentbranch = request.getParameter("currentbranch");
        String tbranch = request.getParameter("tbranch");
        usersService.edit(users);



        Users sessionUser = usersService.findUserByName(retrieveLoggedinUserName());
        RCSLog rcsLog = new RCSLog();
        Branches branchName = branchesService.findById(users.getBranches().getBranchId());
        UserTypes userType = userTypesService.findById(users.getUserTypes().getUserTypeId());

        rcsLog.setUsers(users);
        rcsLog.setSessionUser(sessionUser.getUserName());
        rcsLog.setUserType(sessionUser.getUserTypes().getUsertype());
        rcsLog.setLogDate(sqlCurrentDate);

        if (currentUserType.equals("RMS Team") && tusertype.equals("RMS Head")) {
            rcsLog.setLogAction("RMS Team " + sessionUser.getUserName() + " edited ID against " + users.getUserName() + " as an usertype  change from " + currentUserType + " to " + tusertype);
        }
        else if ((currentUserType.equals("RMS Team") || currentUserType.equals("RMS Head")) && !tusertype.equals("Branch User")) {
            rcsLog.setLogAction("RMS Team " + sessionUser.getUserName() + " edited ID against " + users.getUserName() + " as an usertype  change from " + currentUserType + " to " + tusertype);
        }
        else if ((currentUserType.equals("RMS Team") || currentUserType.equals("RMS Head")) && tusertype.equals("Branch User")) {
            rcsLog.setLogAction("RMS Team " + sessionUser.getUserName() + " edited ID against " + users.getUserName() + " as an " + userType.getUsertype() + " in " + branchName.getBranchName() + " change usertype from " + currentUserType + " to " + tusertype);
        }
        else if ((currentUserType.equals("Branch User") && (tusertype.equals("RMS Team") || tusertype.equals("RMS Head")))) {
            rcsLog.setLogAction("RMS Team " + sessionUser.getUserName() + " edited ID against " + users.getUserName() + " as an " + userType.getUsertype() + " of " + branchName.getBranchName()+"'s user" + " change usertype from "+ currentUserType + " to " + tusertype);
        }
        else if (currentUserType.equals("Branch User")) {
            rcsLog.setLogAction("RMS Team " + sessionUser.getUserName() + " edited ID against " + users.getUserName() + " of tranfer him " + currentUserType + " from " + currentbranch + " to " + tbranch);
        }

        if((currentstatus.equals("Active") && afterStatus != "") || (currentstatus.equals("In Active") && afterStatus != "")){
            rcsLog.setLogAction("RMS Team " + sessionUser.getUserName() + " has been changed " + users.getUserName() + " status " +currentstatus+ " to " +afterStatus);
        }


        rcsLogService.add(rcsLog);

        return "redirect:/rcsTeam/users";
    }

    @RequestMapping(value = {"/users/reset/{id}"}, method = RequestMethod.GET)
    public String resetUserByRCSTeam(@PathVariable int id, HttpServletRequest request, HttpServletResponse response) {


        java.util.Date date = new Date();
        java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());

        Users sessionUser = usersService.findUserByName(retrieveLoggedinUserName());
        Users users = usersService.findById(id);
        RCSLog rcsLog = new RCSLog();
        Branches branchName = branchesService.findById(users.getBranches().getBranchId());
        UserTypes userType = userTypesService.findById(users.getUserTypes().getUserTypeId());

        users.setRestPassword(false);
        users.setPassword("$2a$10$1cus66R4wzYTNxRAEmyfE.UNjRivJ3vIODx8R5u7EaQwl8XLKXRyC");
        usersService.edit(users);

        rcsLog.setUsers(users);
        rcsLog.setSessionUser(sessionUser.getUserName());
        rcsLog.setUserType(sessionUser.getUserTypes().getUsertype());
        rcsLog.setLogDate(sqlCurrentDate);
        if (users.getUserTypes().getUserTypeId() == 2) {
            rcsLog.setLogAction("RMS Team " + sessionUser.getUserName() + " has reset password of " + users.getUserName() + " as a " + userType.getUsertype() + " in " + branchName.getBranchName());
        } else if (users.getUserTypes().getUserTypeId() == 3) {
            rcsLog.setLogAction("RMS Team " + sessionUser.getUserName() + " has reset password of " + users.getUserName() + " as a " + userType.getUsertype() + " in RMS Management Team");
        } else if (users.getUserTypes().getUserTypeId() == 4) {
            rcsLog.setLogAction("RMS Team " + sessionUser.getUserName() + " has reset password of " + users.getUserName() + " as a " + userType.getUsertype() + " in " + branchName.getBranchName());
        }
        rcsLogService.add(rcsLog);

        String name = users.getName();
        String userName = users.getUserName();
        String email = users.getEmail();
        mailMail.sendMailToRI("rcs.ublinusrers@gmail.com", email, name, "Dear" + " " + name + "\n" + "\n" + "\n" + "Your account password has been refreshed.\n\n" + "Your User Credentials are given below.\n\n" + "User Name = " + userName + "\n" + "Password = uil@123" + "\n\n" + "http:://ublionline.com/ublircs/login");


        return "redirect:/rcsTeam/users";
    }

    @RequestMapping("/users/restPassword/{id}")
    public String restPassword(@PathVariable("id") int id, Model model) {
        Users users = usersService.findById(id);

        model.addAttribute("users", users);

        return "RMSTeam/users/restPassword";
    }

    @RequestMapping(value = "/rcsTeam/restPassword", method = RequestMethod.POST)
    public String restPasswordPost(@Valid @ModelAttribute("users") Users users, BindingResult result, HttpServletRequest request) {

        if (result.hasErrors()) {

            return "RMSTeam/users/restPassword";
        }

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        users.setPassword(encoder.encode(users.getPassword()));


        usersService.edit(users);

        return "redirect:/rcsTeam/users";
    }

    @RequestMapping(value = "/getUserName", method = RequestMethod.GET)
    public @ResponseBody String getUserName(@RequestParam String username) {

        List<Users> usersList = usersService.findAll();
        Users users = usersService.findUserByName(username);

        for (int i = 0; i < usersList.size(); i++) {

            if (username.equals(usersList.get(i).getUserName())) {
                return "<span><a style='color: red'>User already exist created in "+users.getCreated()+"</span>";
            }
        }
        return "";
    }

    @RequestMapping(value = "/getUserEmail", method = RequestMethod.GET)
    public @ResponseBody
    String getUserEmail(@RequestParam String email) {

        List<Users> usersList = usersService.findAll();
        Users users = usersService.findUserByEmail(email);

        for (int i = 0; i < usersList.size(); i++) {

            if (email.equals(usersList.get(i).getEmail())) {
                return "<span><a style='color: red'>Email already exist which is pertaining with "+users.getUserName()+" created in "+users.getCreated()+"</span>";
            }
        }
        return "";
    }

     /* User creation edition mode ends */

    /* Surveyors Creation Edition Start */

    @RequestMapping("/home/surveyors")
    public String homeSurveyors(Model model) {
        List<Surveyors> surveyors = surveyorsService.findAll();
        model.addAttribute("surveyors", surveyors);

        return "RMSTeam/surveyors/surveyorGrid";
    }

    @RequestMapping("/surveyors")
    public String surveyorsInventory(Model model) {
        List<Surveyors> surveyors = surveyorsService.findAll();
        model.addAttribute("surveyors", surveyors);

        return "RMSTeam/surveyors/surveyorGrid";
    }

    @RequestMapping("/surveyors/add")
    public String addSurveyor(Model model) {
        Surveyors surveyors = new Surveyors();

        model.addAttribute("surveyors", surveyors);

        return "RMSTeam/surveyors/addSurveyor";
    }

    @RequestMapping(value = "/surveyors/add", method = RequestMethod.POST)
    public String addSurveyorPost(@Valid @ModelAttribute("users") Surveyors surveyors, BindingResult result, HttpServletRequest request, Model model) {

        if (result.hasErrors()) {
            return "RMSTeam/surveyors/addSurveyor";
        }

        List<Surveyors> surveyorsList = surveyorsService.findAll();

        for (int i = 0; i < surveyorsList.size(); i++) {

            if (surveyors.getSurveyorName().equals(surveyorsList.get(i).getUserName())) {
                model.addAttribute("usernameMsg", "User Name already exists");

                return "RMSTeam/surveyors/addSurveyor";
            }
            if (surveyors.getEmail().equals(surveyorsList.get(i).getEmail())) {
                model.addAttribute("emailMsg", "Email already exists");

                return "RMSTeam/surveyors/addSurveyor";
            }
        }


        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        surveyors.setPassword(encoder.encode("uil@123"));
        surveyors.setAuthority("ROLE_SURVEYOR");

        Date date = new Date();
        java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());

        surveyors.setCreated(sqlCurrentDate);

        surveyors.setStatus(true);
        surveyors.setRestPassword(false);

        surveyorsService.add(surveyors);
        Users sessionUser = usersService.findUserByName(retrieveLoggedinUserName());
        RCSLog rcsLog = new RCSLog();

        rcsLog.setSurveyors(surveyors);
        rcsLog.setSessionUser(sessionUser.getUserName());
        rcsLog.setUserType(sessionUser.getUserTypes().getUsertype());
        rcsLog.setLogDate(sqlCurrentDate);
        rcsLog.setLogAction("RMS Team " + sessionUser.getUserName() + " added " + surveyors.getUserName() + " as a surveyor");

        rcsLogService.add(rcsLog);

        String name = surveyors.getSurveyorName();
        String userName = surveyors.getUserName();
        String email = surveyors.getEmail();
        mailMail.sendMailToRI("rcs.ublinusrers@gmail.com", email, name, "Dear" + " " + name + "\n" + "\n" + "\n" + "Your account has been created successfully.\n\n" + "Your User Credentials are given below.\n\n" + "User Name = " + userName + "\n" + "Password = uil@123" + "\n\n" + "http:://ublionline.com/ublircs/login");

        return "redirect:/rcsTeam/surveyors";

    }

    @RequestMapping("/surveyors/edit/{id}")
    public String editSurveyor(@PathVariable("id") int id, Model model) {
        Surveyors surveyors = surveyorsService.findById(id);

        model.addAttribute("surveyors", surveyors);

        return "RMSTeam/surveyors/editSurveyor";
    }

    @RequestMapping(value = "/surveyors/edit", method = RequestMethod.POST)
    public String editSurveyorPost(@Valid @ModelAttribute("surveyors") Surveyors surveyors, BindingResult result, HttpServletRequest request, HttpServletResponse response) {

        if (result.hasErrors()) {

            return "RMSTeam/surveyors/editSurveyor";
        }

        Date date = new Date();
        java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());

        java.sql.Date creationData = surveyors.getCreated();
        surveyors.setCreated(surveyors.getCreated());
        surveyors.setModified(sqlCurrentDate);

        surveyorsService.edit(surveyors);



        Users sessionUser = usersService.findUserByName(retrieveLoggedinUserName());
        RCSLog rcsLog = new RCSLog();

        rcsLog.setSurveyors(surveyors);
        rcsLog.setSessionUser(sessionUser.getUserName());
        rcsLog.setUserType(sessionUser.getUserTypes().getUsertype());
        rcsLog.setLogDate(sqlCurrentDate);

        rcsLogService.add(rcsLog);

        return "redirect:/rcsTeam/surveyors";
    }

    @RequestMapping(value = {"/surveyors/reset/{id}"}, method = RequestMethod.GET)
    public String resetSurveyorByRCSTeam(@PathVariable int id, HttpServletRequest request, HttpServletResponse response) {


        java.util.Date date = new Date();
        java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());

        Users sessionUser = usersService.findUserByName(retrieveLoggedinUserName());
        Surveyors surveyors = surveyorsService.findById(id);
        RCSLog rcsLog = new RCSLog();

        surveyors.setRestPassword(false);
        surveyors.setPassword("$2a$10$1cus66R4wzYTNxRAEmyfE.UNjRivJ3vIODx8R5u7EaQwl8XLKXRyC");
        surveyorsService.edit(surveyors);

        rcsLog.setSurveyors(surveyors);
        rcsLog.setSessionUser(sessionUser.getUserName());
        rcsLog.setUserType(sessionUser.getUserTypes().getUsertype());
        rcsLog.setLogDate(sqlCurrentDate);
        rcsLog.setLogAction("RMS Team " + sessionUser.getUserName() + " has reset password of " + surveyors.getUserName());
        rcsLogService.add(rcsLog);

        String name = surveyors.getSurveyorName();
        String userName = surveyors.getUserName();
        String email = surveyors.getEmail();
        mailMail.sendMailToRI("rcs.ublinusrers@gmail.com", email, name, "Dear" + " " + name + "\n" + "\n" + "\n" + "Your account password has been refreshed.\n\n" + "Your User Credentials are given below.\n\n" + "User Name = " + userName + "\n" + "Password = uil@123" + "\n\n" + "http:://ublionline.com/ublircs/login");


        return "redirect:/rcsTeam/surveyors";
    }

    @RequestMapping("/surveyors/resetSurveyorPassword/{id}")
    public String resetSurveyorPassword(@PathVariable("id") int id, Model model) {
        Surveyors surveyors = surveyorsService.findById(id);

        model.addAttribute("surveyors", surveyors);

        return "RMSTeam/surveyors/resetSurveyorPassword";
    }

    @RequestMapping(value = "/rcsTeam/resetPassword", method = RequestMethod.POST)
    public String resetSurveyorPasswordPost(@Valid @ModelAttribute("surveyors") Surveyors surveyors, BindingResult result, HttpServletRequest request) {

        if (result.hasErrors()) {

            return "RMSTeam/surveyors/resetSurveyorPassword";
        }

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        surveyors.setPassword(encoder.encode(surveyors.getPassword()));


        surveyorsService.edit(surveyors);

        return "redirect:/rcsTeam/surveyors";
    }

    @RequestMapping(value = "/getSurveyorName", method = RequestMethod.GET)
    public @ResponseBody String getSurveyorName(@RequestParam String username) {

        List<Surveyors> surveyorsList = surveyorsService.findAll();
        Surveyors surveyors = surveyorsService.findByUserName(username);

        for (int i = 0; i < surveyorsList.size(); i++) {

            if (username.equals(surveyorsList.get(i).getUserName())) {
                return "<span><a style='color: red'>Surveyor already exist created in "+surveyors.getCreated()+"</span>";
            }
        }
        return "";
    }

    @RequestMapping(value = "/getSurveyorEmail", method = RequestMethod.GET)
    public @ResponseBody
    String getSurveyorEmail(@RequestParam String email) {

        List<Surveyors> surveyorsList = surveyorsService.findAll();
        Surveyors surveyors = surveyorsService.findUserByEmail(email);

        for (int i = 0; i < surveyorsList.size(); i++) {

            if (email.equals(surveyorsList.get(i).getEmail())) {
                return "<span><a style='color: red'>Email already exist which is pertaining with "+surveyors.getUserName()+" created in "+surveyors.getCreated()+"</span>";
            }
        }
        return "";
    }

    @RequestMapping(value = "/getSurveyorCode", method = RequestMethod.GET)
    public @ResponseBody
    String getSurveyorCode(@RequestParam String code) {

        List<Surveyors> surveyorsList = surveyorsService.findAll();
        Surveyors surveyors = surveyorsService.findUserByCode(code);

        for (int i = 0; i < surveyorsList.size(); i++) {

            if (code.equals(surveyorsList.get(i).getSurveyorCode())) {
                return "<span><a style='color: red'>Surveyor code already exist which is pertaining with "+surveyors.getUserName()+" created in "+surveyors.getCreated()+"</span>";
            }
        }
        return "";
    }

    /* Surveyors Creation Edition Ends */

    /* Branches Creation Edition Start */

    @RequestMapping("/branches")
    public String branchesInventory(Model model) {
        List<Branches> branches = branchesService.findAll();
        model.addAttribute("branches", branches);

        return "RMSTeam/branches/branchGrid";
    }

    @RequestMapping("/branches/add")
    public String addBranch(Model model){
        Branches branches = new Branches();

        model.addAttribute("branches", branches);

        return "RMSTeam/branches/addBranches";
    }

    @RequestMapping(value="/branches/add", method = RequestMethod.POST)
    public String addBranchPost(@Valid @ModelAttribute("branches") Branches branches, BindingResult result, HttpServletRequest request){

        if(result.hasErrors()){
            return "RMSTeam/branches/addBranches";
        }

        java.util.Date date = new Date();
        java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());
        branches.setStatus(true);
        branches.setCreationDate(sqlCurrentDate);
        branchesService.add(branches);

        Users sessionUser = usersService.findUserByName(retrieveLoggedinUserName());
        RCSLog rcsLog = new RCSLog();

        String branchName = branches.getBranchName();

        rcsLog.setSessionUser(sessionUser.getUserName());
        rcsLog.setUserType(sessionUser.getUserTypes().getUsertype());
        rcsLog.setLogDate(sqlCurrentDate);
        rcsLog.setLogAction("Branch add activity  " + branchName + "by " + sessionUser);
        rcsLogService.add(rcsLog);


        return "redirect:/rcsTeam/branches";
    }

    @RequestMapping("/branches/edit/{id}")
    public String editBranch(@PathVariable("id") int id, Model model){
        Branches branches = branchesService.findById(id);

        model.addAttribute("branches", branches);

        return "RMSTeam/branches/editBranches";
    }


    @RequestMapping(value="/branches/edit", method = RequestMethod.POST)
    public String editBranchPost(@Valid @ModelAttribute("branches") Branches branches,@RequestParam("currentBranchCode") String currentBranchCode,@RequestParam("afterBranchCode") String afterBranchCode, @RequestParam("currentLocationCode") String currentLocationCode,@RequestParam("afterLocationCode") String afterLocationCode,@RequestParam("currentBranchName") String currentBranchName,@RequestParam("afterBranchName") String afterBranchName, BindingResult result, HttpServletRequest request){

        if(result.hasErrors()){
            return "RMSTeam/branches/editBranches";
        }

        int cBC = Integer.parseInt(currentBranchCode);
        int aBC = Integer.parseInt(afterBranchCode);
        int cLC = Integer.parseInt(currentLocationCode);
        int aLC = Integer.parseInt(afterLocationCode);
        int cBN = Integer.parseInt(currentBranchName);
        int aBN = Integer.parseInt(afterBranchName);

        java.util.Date date = new Date();
        java.sql.Date sqlCurrentDate = new java.sql.Date(date.getTime());
        branches.setModificationDate(sqlCurrentDate);

        branchesService.edit(branches);

        Users sessionUser = usersService.findUserByName(retrieveLoggedinUserName());
        RCSLog rcsLog = new RCSLog();

        String branchName = branches.getBranchName();

        rcsLog.setSessionUser(sessionUser.getUserName());
        rcsLog.setUserType(sessionUser.getUserTypes().getUsertype());
        rcsLog.setLogDate(sqlCurrentDate);

        if ( currentBranchCode != afterBranchCode){
            rcsLog.setLogAction("Branch edit activity branch code " + currentBranchCode + "%20" + "change to " + afterBranchCode + "by " + sessionUser);
        }


        rcsLogService.add(rcsLog);

        return "redirect:/rcsTeam/branches";
    }

    /* Branches Creation Edition Ends */



    @ModelAttribute("AllUserTypes")
    public List<UserTypes> populateUserTypesSpecific() {
        List<UserTypes> userTypesSpecificList = userTypesService.findSpecific();
        return userTypesSpecificList;
    }

    @ModelAttribute("AllBranchesForUsers")
    public List<Branches> populateBranches() {
        List<Branches> branches = branchesService.findAll();
        return branches;
    }

    private void setUserBranch(int id, Users users) {
        if (id == 1 || id == 2 || id == 3) {

            Branches b = branchesService.findById(1);

            users.setBranches(b);
        }
        usersService.edit(users);
    }

    @ModelAttribute("AllUsers")
    public List<Users> populateAllUsers() {
        List<Users> usersList = usersService.findAllUsers();
        return usersList;
    }

    @ModelAttribute("AllIndustryTypeSpecificList")
    public List<Options> populateInsdustrySpecificList() {
        List<Options> industry = CustomList.populateInsdustrySpecificList();
        return industry;
    }

    private String retrieveLoggedinUserName() {
        Object principal = SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();

        if (principal instanceof UserDetails)
            return ((UserDetails) principal).getUsername();

        return principal.toString();
    }

}

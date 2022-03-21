package com.ublircs.controller;

import com.ublircs.model.Surveyors;
import com.ublircs.model.Users;
import com.ublircs.service.SurveyorsService;
import com.ublircs.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Created by Haider Iqbal on 10/19/2020.
 */
@Controller
public class LoginController {

    @Autowired
    private UsersService usersService;

    @Autowired
    private SurveyorsService surveyorsService;

    @RequestMapping("/login")
    public String login(
            @RequestParam(value = "error", required = false)
            String error,
            @RequestParam(value = "logout", required = false)
            String logout,
            Model model) {

        if (error != null) {
            model.addAttribute("error", "Invalid username and password");
        }

        if (logout != null) {
            model.addAttribute("logout", "You have been logged out successfully");
        }
        return "login";


    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }
        return "redirect:/login?logout";
    }


    @RequestMapping("/login/restPassword")
    public String restPassword(Model model){
        Users users = usersService.findUserByName(retrieveLoggedinUserName());

        if (users.getRestPassword() == true){
            if(users.getUserTypes().getAuthority().equals("ROLE_ADMIN")){
                return "redirect:/admin/home";
            }
            if(users.getUserTypes().getAuthority().equals("ROLE_BRANCH_USER")){
                return "redirect:/branchUser/home";
            }
            if(users.getUserTypes().getAuthority().equals("ROLE_RMS_TEAM")){
                return "redirect:/rcsTeam/home";
            }
            if(users.getUserTypes().getAuthority().equals("ROLE_RMS_HEAD")){
                return "redirect:/rcsHead/home";
            }

        }

        model.addAttribute("users", users);

        return "resetPassword";
    }

    @RequestMapping("/login/surveyors/resetPassword")
    public String resetSurveyorPassword(Model model){
        Surveyors surveyors = surveyorsService.findByUserName(retrieveLoggedinUserName());

        if (surveyors.getRestPassword() == true){

            if(surveyors.getAuthority().equals("ROLE_SURVEYOR")){
                return "redirect:/surveyor/home";
            }

        }

        model.addAttribute("surveyors", surveyors);

        return "resetPassword";
    }

    @RequestMapping(value="/login/restPasswordChange", method = RequestMethod.GET)
    public String restPasswordPost(@RequestParam("password") String password){

        Users users = usersService.findUserByName(retrieveLoggedinUserName());

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        users.setPassword(encoder.encode(password));
        users.setRestPassword(true);

        usersService.edit(users);

        return "redirect:/logout";
    }

    private String retrieveLoggedinUserName() {
        Object principal = SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();

        if (principal instanceof UserDetails)
            return ((UserDetails) principal).getUsername();

        else if (principal instanceof UserDetails)
            return ((UserDetails) principal).getClass().getName();

        return principal.toString();
    }


}

package com.ublircs.controller.branchUser;


import com.ublircs.model.RAForms;
import com.ublircs.model.Users;
import com.ublircs.service.RAFormsService;
import com.ublircs.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Controller
@RequestMapping("/branchUser")
@SessionAttributes("name")
public class BranchUserHome {


    @Autowired
    RAFormsService raFormsService;

    @Autowired
    UsersService usersService;

    @RequestMapping("/home")
    public String home(Model model){

        Users users = usersService.findUserByName(retrieveLoggedinUserName());

       List<RAForms> allBranchWise = raFormsService.findAllBranchWise(users.getBranches().getBranchId());

        model.addAttribute("allBranchWise", allBranchWise);

        return "BranchUser/riskLocationGrid";
    }

    @RequestMapping("/riskLocations")
    public String risklocations(Model model){

        Users users = usersService.findUserByName(retrieveLoggedinUserName());

        List<RAForms> allBranchWise = raFormsService.findAllBranchWise(users.getBranches().getBranchId());

        model.addAttribute("allBranchWise", allBranchWise);

        return "BranchUser/riskLocationGrid";
    }

    private String retrieveLoggedinUserName() {
        Object principal = SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();

        if (principal instanceof UserDetails)
            return ((UserDetails) principal).getUsername();

        return principal.toString();
    }
}

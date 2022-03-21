package com.ublircs.controller.rcsHead;

import com.ublircs.model.*;
import com.ublircs.service.*;
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
@RequestMapping("/rcsHead")
@SessionAttributes("name")
public class RCSHeadHome {

    @Autowired
    RAFormsService raFormsService;

    @RequestMapping("/home")
    public String home(Model model) {

        List<RAForms> raFormsList = raFormsService.findAll();

        model.addAttribute("raFormsList", raFormsList);

        return "RMSHead/riskLocationGrid";
    }

    @RequestMapping("/riskLocations")
    public String risklocations(Model model) {

        List<RAForms> raFormsList = raFormsService.findAll();

        model.addAttribute("raFormsList", raFormsList);

        return "RMSHead/riskLocationGrid";
    }

    private String retrieveLoggedinUserName() {
        Object principal = SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();

        if (principal instanceof UserDetails)
            return ((UserDetails) principal).getUsername();

        return principal.toString();
    }

}

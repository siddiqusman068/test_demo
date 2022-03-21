package com.ublircs.util;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

/**
 * Created by Usman Siddiq on 3/5/2019.
 */
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {


    String adminTarget = "admin/home";
    String branchUserTarget = "branchUser/home";
    String rcsTeamTarget = "rcsTeam/home";
    String rcsHeadTarget = "rcsHead/home";
    String surveyorTarget = "surveyor/home";
    String intitiallogin = "login/restPassword";

    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {

        Set<String> authorities = AuthorityUtils.authorityListToSet(authentication.getAuthorities());

        if(authorities.contains("ROLE_ADMIN")){
            httpServletResponse.sendRedirect(intitiallogin);
        }else if (authorities.contains("ROLE_BRANCH_USER")){
            httpServletResponse.sendRedirect(intitiallogin);
        }else if (authorities.contains("ROLE_RMS_TEAM")){
            httpServletResponse.sendRedirect(intitiallogin);
        }else if (authorities.contains("ROLE_RMS_HEAD")){
            httpServletResponse.sendRedirect(intitiallogin);
        }else if (authorities.contains("ROLE_SURVEYOR")){
            httpServletResponse.sendRedirect(surveyorTarget);
        }else {
            throw new IllegalStateException();
        }

    }
}

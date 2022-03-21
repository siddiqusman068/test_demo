package com.ublircs.service;

import com.ublircs.model.Users;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
public interface UsersService {

    List<Users> findAll();
    List<Users> findAllUsers();
    List<Users> findAllUsersByBranchId(int id);
    List<Users> findAllUsersRMTeams(int userType);
    Users findById(int id);
    void add(Users users);
    void edit(Users users);
    Users findUserByName(String username);
    Users findUserByEmail(String email);

}

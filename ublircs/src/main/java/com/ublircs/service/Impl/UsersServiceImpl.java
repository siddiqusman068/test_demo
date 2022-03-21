package com.ublircs.service.Impl;

import com.ublircs.dao.UsersDao;
import com.ublircs.model.Users;
import com.ublircs.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Service
public class UsersServiceImpl implements UsersService{

    @Autowired
    UsersDao usersDao;

    public List<Users> findAll() {
        return usersDao.findAll();
    }

    public List<Users> findAllUsers() {
        return usersDao.findAllUsers();
    }

    public List<Users> findAllUsersByBranchId(int id) {
        return usersDao.findAllUsersByBranchId(id);
    }

    public List<Users> findAllUsersRMTeams(int userType) {
        return usersDao.findAllUsersRMTeams(userType);
    }

    public Users findById(int id) {
        return usersDao.findById(id);
    }

    public void add(Users users) {
        usersDao.add(users);
    }

    public void edit(Users users) {
        usersDao.edit(users);
    }

    public Users findUserByName(String username) {
        return usersDao.findUserByName(username);
    }

    public Users findUserByEmail(String email) {
        return usersDao.findUserByEmail(email);
    }
}

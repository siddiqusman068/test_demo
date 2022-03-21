package com.ublircs.dao.Impl;

import com.ublircs.dao.UsersDao;
import com.ublircs.model.Users;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Repository
@Transactional
public class UsersDaoImpl implements UsersDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<Users> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Users");
        List<Users> usersList = query.list();
        session.flush();

        return usersList;
    }

    public List<Users> findAllUsers() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("SELECT * from Users WHERE UserTypeId NOT In (1)").addEntity(Users.class);
        List<Users> usersList = query.list();
        session.flush();

        return usersList;
    }


    public List<Users> findAllUsersByBranchId(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Users where BranchId =" + "'" + id + "'");
        List<Users> usersList = query.list();

        return usersList;
    }

    public List<Users> findAllUsersRMTeams(int userType) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Users where UserTypeId =" + "'" + userType + "'");
        List<Users> usersList = query.list();

        return usersList;
    }

    public Users findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Users users = (Users) session.get(Users.class, id);
        session.flush();
        return users;
    }

    public void add(Users users) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(users);
        session.flush();
    }

    public void edit(Users users) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(users);
        session.flush();
    }

    public Users findUserByName(String username) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Users u WHERE u.userName = :userName");
        query.setParameter("userName", username);
        Users users = (Users) query.uniqueResult();
        session.flush();

        return users;
    }

    public Users findUserByEmail(String email) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Users u WHERE u.email = :email");
        query.setParameter("email", email);
        Users users = (Users) query.uniqueResult();
        session.flush();
        return users;
    }
}

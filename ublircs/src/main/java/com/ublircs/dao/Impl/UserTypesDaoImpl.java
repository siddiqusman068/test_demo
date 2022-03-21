package com.ublircs.dao.Impl;

import com.ublircs.dao.UserTypesDao;
import com.ublircs.model.UserTypes;
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
public class UserTypesDaoImpl implements UserTypesDao{

    @Autowired
    private SessionFactory sessionFactory;

    public List<UserTypes> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from UserTypes");
        List<UserTypes> userTypesList = query.list();
        return userTypesList;
    }

    public UserTypes findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        UserTypes userTypes = (UserTypes) session.get(UserTypes.class, id);
        session.flush();

        return userTypes;
    }

    public List<UserTypes> findSpecific() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("select * from usertypes where userTypeId not in(1,2)").addEntity(UserTypes.class);
        List<UserTypes> userTypesSpecificList = query.list();
        return userTypesSpecificList;
    }
}

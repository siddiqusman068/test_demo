package com.ublircs.model;


import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

/**
 * Created by Usman Siddiq on 3/5/2019.
 */
@Entity
@Table(name= "Users")
public class Users implements Serializable{

    private static final long serialVersionUID = -3532377236419382983L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int userId;

    @Column(name = "Name", columnDefinition = "varchar(50)")
    private String name;

    @Column(name = "UserName",  columnDefinition = "varchar(50)")
    private String userName;

    @Column(name = "Email",  columnDefinition = "varchar(50)")
    private String email;

    @Column(name = "Password",  columnDefinition = "varchar(100)")
    private String password;

    @Column(name = "Status")
    private Boolean status;

    @Column(name = "RestPassword")
    private Boolean restPassword;

    @Column(name = "Created")
    private Date created;

    @Column(name = "Modified")
    private Date modified;

    @OneToOne
    @JoinColumn(name = "UserTypeId")
    private UserTypes userTypes;

    @OneToOne
    @JoinColumn(name = "BranchId")
    private Branches branches;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Boolean getRestPassword() {
        return restPassword;
    }

    public void setRestPassword(Boolean restPassword) {
        this.restPassword = restPassword;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getModified() {
        return modified;
    }

    public void setModified(Date modified) {
        this.modified = modified;
    }

    public UserTypes getUserTypes() {
        return userTypes;
    }

    public void setUserTypes(UserTypes userTypes) {
        this.userTypes = userTypes;
    }

    public Branches getBranches() {
        return branches;
    }

    public void setBranches(Branches branches) {
        this.branches = branches;
    }
}

package com.ublircs.model;


import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

/**
 * Created by Administrator on 2/28/2017.
 */
@Entity
@Table(name = "Surveyors")
public class Surveyors implements Serializable {

    private static final long serialVersionUID = -3532377236419382983L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int surveyorId;


    @Column(name="SurveyorName")
    private String surveyorName;

    @Column(name="Email")
    private String email;

    @Column (name = "MobileContact")
    private String mobileContact;

    @Column(name="Password")
    private String password;

    @Column(name="SurveyorCode")
    private String surveyorCode;

    private Boolean status;

    @Column(name = "RestPassword")
    private Boolean restPassword;

    @Column(name="CreatedBy")
    private String createdBy;

    @Column(name = "Created")
    private Date created;

    @Column(name = "Modified")
    private Date modified;

    @Column(name="UserName")
    private String userName;

    @Column(name="Authority")
    private String authority;

    public int getSurveyorId() {
        return surveyorId;
    }

    public void setSurveyorId(int surveyorId) {
        this.surveyorId = surveyorId;
    }

    public String getSurveyorName() {
        return surveyorName;
    }

    public void setSurveyorName(String surveyorName) {
        this.surveyorName = surveyorName;
    }

    public String getSurveyorCode() {
        return surveyorCode;
    }

    public void setSurveyorCode(String surveyorCode) {
        this.surveyorCode = surveyorCode;
    }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }

    public String getMobileContact() {
        return mobileContact;
    }

    public void setMobileContact(String mobileContact) {
        this.mobileContact = mobileContact;
    }

    public String getPassword() { return password; }

    public void setPassword(String password) { this.password = password; }

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

    public String getUserName() { return userName; }

    public void setUserName(String userName) { this.userName = userName; }

    public String getCreatedBy() { return createdBy; }

    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }

    public String getAuthority() { return authority; }

    public void setAuthority(String authority) { this.authority = authority; }
}

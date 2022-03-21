package com.ublircs.model;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Entity
@Table(name = "RCSLog")
public class RCSLog implements Serializable{

    private static final long serialVersionUID = 3940578625296145582L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int rcsLogId;

    @Column (name = "RAFormNo")
    private String RAFormNo;

    @Column( name="LogDate")
    private Date logDate;

    @Column (name = "LogAction")
    private String logAction;

    @Column (name = "SessionUser")
    private String sessionUser;

    @Column (name = "UserType")
    private String userType;

    @Column (name = "FindingAndComment")
    private String findingLogBySession;

    @Column (name = "FindingAndCommentDate")
    private String findingLogBySessionDate;

    @OneToOne
    @JoinColumn(name = "raFormId")
    private RAForms raForm;

    @OneToOne
    @JoinColumn(name = "UserId")
    private Users users;

    @OneToOne
    @JoinColumn(name = "SurveyorId")
    private Surveyors surveyors;

    public int getRcsLogId() {
        return rcsLogId;
    }

    public void setRcsLogId(int rcsLogId) {
        this.rcsLogId = rcsLogId;
    }

    public String getRAFormNo() {
        return RAFormNo;
    }

    public void setRAFormNo(String RAFormNo) {
        this.RAFormNo = RAFormNo;
    }

    public Date getLogDate() {
        return logDate;
    }

    public void setLogDate(Date logDate) {
        this.logDate = logDate;
    }

    public String getLogAction() {
        return logAction;
    }

    public void setLogAction(String logAction) {
        this.logAction = logAction;
    }

    public String getSessionUser() {
        return sessionUser;
    }

    public void setSessionUser(String sessionUser) {
        this.sessionUser = sessionUser;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getFindingLogBySession() {
        return findingLogBySession;
    }

    public void setFindingLogBySession(String findingLogBySession) {
        this.findingLogBySession = findingLogBySession;
    }

    public String getFindingLogBySessionDate() {
        return findingLogBySessionDate;
    }

    public void setFindingLogBySessionDate(String findingLogBySessionDate) {
        this.findingLogBySessionDate = findingLogBySessionDate;
    }

    public RAForms getRaForm() {
        return raForm;
    }

    public void setRaForm(RAForms raForm) {
        this.raForm = raForm;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public Surveyors getSurveyors() {
        return surveyors;
    }

    public void setSurveyors(Surveyors surveyors) {
        this.surveyors = surveyors;
    }
}

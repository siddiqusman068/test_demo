package com.ublircs.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

/**
 * Created by Usman Siddiq on 12/6/2017.
 */
//POJO of Branch Entity
@Entity
@Table(name = "Branches")
public class Branches implements Serializable{

    private static final long serialVersionUID = -3536677236419382983L;

    //Instance Variables of Branches Class

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int branchId;

    @NotEmpty(message = "Branch name must not be empty")
    @Column(name = "BranchName", nullable = false, columnDefinition = "varchar(50)")
    private String branchName;

    @NotEmpty(message = "Branch code must not be empty")
    @Column(name="BranchCode", nullable = false, columnDefinition = "varchar(50)")
    private String branchCode;

    @NotEmpty(message = "Location code must not be empty")
    @Column(name="LocationCode", nullable = false, columnDefinition = "varchar(50)")
    private String locationCode;

    //@Column(name="FedRates")
   // private byte fedRates;

    @Column(name="Status")
    private Boolean status;

    @Column(name="CreationDate")
    private Date creationDate;

    @Column(name="ModificationDate")
    private Date modificationDate;

    //Instance Variables of Branches Class Ends

    //Getters and Setter of Branches Entity

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public String getBranchCode() {
        return branchCode;
    }

    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }

    public String getLocationCode() {
        return locationCode;
    }

    public void setLocationCode(String locationCode) {
        this.locationCode = locationCode;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Date getModificationDate() {
        return modificationDate;
    }

    public void setModificationDate(Date modificationDate) {
        this.modificationDate = modificationDate;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    //Getters and Setter of Branches Entity Ends
}

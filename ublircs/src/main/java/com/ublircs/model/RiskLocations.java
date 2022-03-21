package com.ublircs.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Usman Siddiq on 12/01/2021.
 */
@Entity
@Table(name = "RiskLocations")
public class RiskLocations implements Serializable {

    private static final long serialVersionUID = 989192250380037359L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int riskLocationId;

    @Column( name="RiskCode", unique = true)
    private String riskCode;

    @Column( name="City")
    private String City;

    @Column( name="RiskLocation")
    private String riskLocation;

    @OneToOne
    @JoinColumn(name = "BranchId")
    private Branches branches;

    @OneToOne
    @JoinColumn(name = "UserId")
    private Users users;

    public int getRiskLocationId() {
        return riskLocationId;
    }

    public void setRiskLocationId(int riskLocationId) {
        this.riskLocationId = riskLocationId;
    }

    public String getRiskCode() {
        return riskCode;
    }

    public void setRiskCode(String riskCode) {
        this.riskCode = riskCode;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String city) {
        City = city;
    }

    public String getRiskLocation() {
        return riskLocation;
    }

    public void setRiskLocation(String riskLocation) {
        this.riskLocation = riskLocation;
    }

    public Branches getBranches() {
        return branches;
    }

    public void setBranches(Branches branches) {
        this.branches = branches;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
}

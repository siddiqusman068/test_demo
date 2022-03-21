package com.ublircs.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Usman Siddiq on 3/5/2019.
 */
@Entity
@Table(name = "UserTypes")
public class UserTypes implements Serializable{

    private static final long serialVersionUID = 3940578625296145582L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int userTypeId;

    @Column(name = "Usertype")
    private String usertype;

    @Column(name = "Authority")
    private String authority;

    public int getUserTypeId() {
        return userTypeId;
    }

    public void setUserTypeId(int userTypeId) {
        this.userTypeId = userTypeId;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }
}

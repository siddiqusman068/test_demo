package com.ublircs.model;

import javax.persistence.*;

/**
 * Created by Usman Siddiq on 22/12/2020.
 */
@Entity
@Table(name = "LocationInspectionPics")
public class LocationInspectionPics {

    private static final long serialVersionUID = -3532377277419382983L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int locInspId;

    @Column(name="Name", length=100, nullable=false)
    private String name;

    @Column(name="Description", length=255)
    private String description;

    @Column(name="Type", length=100, nullable=false)
    private String type;

    @Lob
    @Basic(fetch = FetchType.LAZY)
    @Column(name="Content", nullable=false)
    private byte[] content;

    @ManyToOne(optional = false)
    @JoinColumn(name = "RAFormId")
    private RAForms raForm;

    public int getLocInspId() {
        return locInspId;
    }

    public void setLocInspId(int locInspId) {
        this.locInspId = locInspId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    public RAForms getRaForm() {
        return raForm;
    }

    public void setRaForm(RAForms raForm) {
        this.raForm = raForm;
    }
}

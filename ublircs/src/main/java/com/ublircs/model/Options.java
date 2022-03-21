package com.ublircs.model;

/**
 * Created by Usman Siddiq on 3/5/2019.
 */
public class Options {

    private String value;

    private String label;

    public Options() {
    }

    public Options(String value, String label) {
        this.value = value;
        this.label = label;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }


}

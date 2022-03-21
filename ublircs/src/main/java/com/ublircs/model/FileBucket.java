package com.ublircs.model;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Usman Siddiq on 3/5/2019.
 */
public class FileBucket {

    MultipartFile file;

    String description;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

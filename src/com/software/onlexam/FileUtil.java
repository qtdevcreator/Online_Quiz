package com.software.onlexam;

import java.io.Serializable;


public class FileUtil implements Serializable {

    public String getWebRootPath() {
        return FileUtil.class.getProtectionDomain().getCodeSource().getLocation().getPath().split("WEB-INF/")[0];
    }    
   
}
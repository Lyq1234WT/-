package com.entity;

import lombok.Data;

import java.util.Date;

@Data
public class depart {

    private int did;
    private String dname;
    private String duty;
    private Date credate;
    private int dstatus;

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    public Date getCredate() {
        return credate;
    }

    public void setCredate(Date credate) {
        this.credate = credate;
    }

    public int getDstatus() {
        return dstatus;
    }

    public void setDstatus(int dstatus) {
        this.dstatus = dstatus;
    }

    public depart() {
    }

    public depart(int did, String dname, String duty, Date credate, int dstatus) {
        this.did = did;
        this.dname = dname;
        this.duty = duty;
        this.credate = credate;
        this.dstatus = dstatus;
    }
}

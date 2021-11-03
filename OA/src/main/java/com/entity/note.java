package com.entity;

import lombok.Data;

import java.sql.Date;

@Data
public class note {
    private int nid;
    private String title;
    private String context;
    private Date startDate;
    private Date endDate;
    private Float length;
    private Date subDate;
    private int eStatus;
    private Date relDate;
    private int eid;

    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Float getLength() {
        return length;
    }

    public void setLength(Float length) {
        this.length = length;
    }

    public Date getSubDate() {
        return subDate;
    }

    public void setSubDate(Date subDate) {
        this.subDate = subDate;
    }

    public int geteStatus() {
        return eStatus;
    }

    public void seteStatus(int eStatus) {
        this.eStatus = eStatus;
    }

    public Date getRelDate() {
        return relDate;
    }

    public void setRelDate(Date relDate) {
        this.relDate = relDate;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public note(int nid, String title, String context, Date startDate, Date endDate, Float length, Date subDate, int eStatus, Date relDate, int eid) {
        this.nid = nid;
        this.title = title;
        this.context = context;
        this.startDate = startDate;
        this.endDate = endDate;
        this.length = length;
        this.subDate = subDate;
        this.eStatus = eStatus;
        this.relDate = relDate;
        this.eid = eid;
    }

    public note() {
    }
}

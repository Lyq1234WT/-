package com.entity;

import lombok.Data;

import java.util.Date;

@Data
public class employee {
    private int eid;
    private String ename;
    private String epass;
    private String realname;
    private int esex;
    private Date entrydate;
    private Date leavedate;
    private int position;
    private int sal;
    private int estatus;
    private int did;
    private String dname;

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getEpass() {
        return epass;
    }

    public void setEpass(String epass) {
        this.epass = epass;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public int getEsex() {
        return esex;
    }

    public void setEsex(int esex) {
        this.esex = esex;
    }

    public Date getEntrydate() {
        return entrydate;
    }

    public void setEntrydate(Date entrydate) {
        this.entrydate = entrydate;
    }

    public Date getLeavedate() {
        return leavedate;
    }

    public void setLeavedate(Date leavedate) {
        this.leavedate = leavedate;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public int getSal() {
        return sal;
    }

    public void setSal(int sal) {
        this.sal = sal;
    }

    public int getEstatus() {
        return estatus;
    }

    public void setEstatus(int estatus) {
        this.estatus = estatus;
    }

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

    public employee(int eid, String ename, String epass, String realname, int esex, Date entrydate, Date leavedate, int position, int sal, int estatus, int did, String dname) {
        this.eid = eid;
        this.ename = ename;
        this.epass = epass;
        this.realname = realname;
        this.esex = esex;
        this.entrydate = entrydate;
        this.leavedate = leavedate;
        this.position = position;
        this.sal = sal;
        this.estatus = estatus;
        this.did = did;
        this.dname = dname;
    }

    public employee() {
    }
}
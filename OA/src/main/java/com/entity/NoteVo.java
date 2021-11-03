package com.entity;

import lombok.Data;

import java.sql.Date;

/**
 * @author 黄熠
 */
@Data
public class NoteVo {
    /**
     * 请假ID
     */
    private  int nid;
    /**
     * 请假标题
     */
    private String title;
    /**
     * 请假理由
     */
    private String context;
    /**
     * 请假开始时间
     */
    private Date startDate;
    /**
     * 请假结束时间
     */
    private Date endDate;
    /**
     * 请假时长
     */
    private float length;
    /**
     * 请假申请时间
     */
    private Date subDate;
    /**
     * 请假状态
     */
    private int eStatus;

    /**
     * 领导申批时间
     */
    private Date relDate;
    /**
     * 请假员工ID
     */
    private int eid;
    /**
     *   真实姓名
     */
    private String  realName;

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

    public float getLength() {
        return length;
    }

    public void setLength(float length) {
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

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public NoteVo() {
    }

    public NoteVo(int nid, String title, String context, Date startDate, Date endDate, float length, Date subDate, int eStatus, Date relDate, int eid, String realName) {
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
        this.realName = realName;
    }
}

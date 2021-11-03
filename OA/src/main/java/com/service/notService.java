package com.service;

import com.entity.employee;
import com.entity.note;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


public interface notService {
    /**
     * findByNoteAll 查询全部信息
     * @param eid
     * @return
     */
    List<note> findByNotePage(int eid);

    /**
     * addNote 申请请假
     * @param note
     * @return
     */
    int addNote(note note);

    /**
     *findIdsByDid
     * @param did
     * @param position
     * @return
     */
    List<Integer> findIdsByDid(int did, int position);

    /**
     * findNoteByIds遍历查询
     * @param ids
     * @param type
     * @return
     */
    List<note> findNoteByIds(List<Integer> ids, int type);

    /**
     * 同意、打回、不同意
     * @param nid
     * @param eStatus
     * @return
     */
    int updateNoteEstatus(int nid,int eStatus);

    /**
     * 根据nid查询信息
     * @param nid
     * @return
     */
    employee findEmpNoteByNid(@Param("nid") int nid);

    /**
     * 根据nid查询Note信息
     * @param nid
     * @return
     */
    note findNoteByNid(@Param("nid") int nid);

    /**
     * 修改信息
     * @param note
     * @return
     */
    int editNote(note note);

}


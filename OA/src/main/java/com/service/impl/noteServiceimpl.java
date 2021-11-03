package com.service.impl;

import com.dao.noteDao;
import com.entity.employee;
import com.entity.note;
import com.service.notService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class noteServiceimpl implements notService {
    @Autowired
    private noteDao noteDao;

    @Override
    public List<note> findByNotePage(int eid) {
        return noteDao.findByNotePage(eid);
    }

    @Override
    public int addNote(note note) {
        return noteDao.addNote(note);
    }

    @Override
    public List<Integer> findIdsByDid(int did, int position) {
        HashMap<String,Object> map = new HashMap<>();
        map.put("did",did);
        map.put("position",position);

        if (did == 1){
            return noteDao.findIdsByDid(map);
        }else {
            return noteDao.findIdsByDidPo(map);
        }
    }

    @Override
    public List<note> findNoteByIds(List<Integer> ids, int type) {
        HashMap<String,Object> map = new HashMap<>();
        map.put("ids",ids);
        map.put("type",type);
        return noteDao.findNoteByIds(map);
    }

    @Override
    public int updateNoteEstatus(int nid, int eStatus) {
        HashMap<String,Object> map = new HashMap<>();
        map.put("nid",nid);
        map.put("eStatus",eStatus);
        return noteDao.updateNoteEstatus(map);
    }

    @Override
    public employee findEmpNoteByNid(int nid) {
        return noteDao.findEmpNoteByNid(nid);
    }

    @Override
    public note findNoteByNid(int nid) {
        return noteDao.findNoteByNid(nid);
    }

    @Override
    public int editNote(note note) {
        return noteDao.editNote(note);
    }
}

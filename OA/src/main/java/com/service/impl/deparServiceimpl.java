package com.service.impl;

import com.dao.departDao;
import com.entity.depart;
import com.service.departService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class deparServiceimpl implements departService {
    @Autowired
    private departDao dao;

    @Override
    public List<depart> selectDdpart(int dstatus) {
        return dao.selectDdpart(dstatus);
    }

    @Override
    public int updateDeprtp(depart depart) {
        return dao.updateDeprtp(depart);
    }

    @Override
    public depart selectDepartById(int did) {
        return dao.selectDepartById(did);
    }

    @Override
    public int insertDepart(String dname, String duty) {
        return dao.insertDepart(dname,duty);
    }

    @Override
    public int deleteDepart(depart depart) {
        return dao.deleteDepart(depart);
    }
}

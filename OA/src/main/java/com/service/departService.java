package com.service;

import com.entity.depart;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


public interface departService {

    List<depart> selectDdpart(int dstatus);

    int updateDeprtp(depart depart);

    depart selectDepartById(int did);

    int insertDepart(@Param("dname") String dname, @Param("duty") String duty);

    int deleteDepart(depart depart);
}

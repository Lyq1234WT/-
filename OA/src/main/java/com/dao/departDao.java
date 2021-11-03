package com.dao;

import com.entity.depart;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface departDao {
    @Select("select * from depart where dstatus=#{dstatus}")
    List<depart> selectDdpart(int dstatus);

    @Update("update depart set dname=#{dname} , duty=#{duty} where did=#{did}")
    @Options(useGeneratedKeys = false)
    int updateDeprtp(depart depart);

    @Select("select * from depart where did=#{did}")

    depart selectDepartById(int did);

    @Insert("insert into depart(dname,duty,credate,dstatus) value(#{dname},#{duty},now(),0)")
    @Options(useGeneratedKeys = false)
    int insertDepart(@Param("dname") String dname,@Param("duty") String duty);

    @Update("update depart set dstatus=#{dstatus} where did=#{did}")
    int deleteDepart(depart depart);
}

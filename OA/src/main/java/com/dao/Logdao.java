package com.dao;


import com.entity.depart;
import com.entity.employee;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface Logdao {
    @Select("select * from employee where ename=#{ename} and epass=#{epass}")
    public employee login(@Param("ename") String ename, @Param("epass") String epass);

    @Select("select * from employee")
    List<employee> select();

    @Update("update employee set epass=#{epass} where eid=#{eid}")
    int updatePwd(employee employee);

    //查询数据
    @Select("select count(*) from employee where estatus=#{estatus} and estatus=#{estatus}")
    int SelectComt(@Param("estatus") int estatus,@Param("realname")String realname);

    //模糊查询和查询
    @Select({"<script>",
            "select * from employee where estatus=#{estatus}",
            "<if test='realname!=null and realname!=\"\"'>",
            "and realname like \"%${realname}%\"",
            "</if>",
            "LIMIT #{page},#{length}",
            "</script>"})
    @Options(useGeneratedKeys = false)
    List<employee> findEmpByPage(@Param("estatus") int estatus,@Param("page") int page,@Param("length") Integer length,@Param("realname")String realname);

    //状态修改
    @Update("update employee set estatus=#{estatus} where eid=#{eid}")
    int deleteUser(@Param("eid")int eid,@Param("estatus")int estatus);

    //新增
    @Insert("insert into employee value(null,#{ename},#{epass},#{realname},#{esex},now(),null,#{position},#{sal},#{estatus},#{did},#{dname})")
    @Options(useGeneratedKeys = false)
    int addUser(employee e);

    //部门查询进去新增
    @Select("select * from depart where dstatus=#{dstatus}")
    List<depart> addUserFindInfo(@Param("dstatus")int dstatus);

    //id查询进去修改
    @Select ("select * from employee where eid=#{eid}")
    employee findUserAndDepts(@Param("eid") int eid);

    //修改
    @Update("update employee set ename=#{ename},epass=#{epass},realname=#{realname},esex=#{esex},sal=#{sal},did=#{did},position=#{position},dname=#{dname} where eid=#{eid}")
    int editUser(employee emp);

}
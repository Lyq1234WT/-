package com.service;

import com.dao.Logdao;
import com.entity.depart;
import com.entity.employee;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class service {
    @Autowired
    private Logdao dao ;


    public employee login(String ename, String epass) {
        return dao.login(ename,epass);
    }

    public List<employee> select(){
        return dao.select();
    }

    public int updatePwd(employee employee){return dao.updatePwd(employee);}

    public List<employee> findEmpByPage(int estatus,int page,int length,String realname){
        return dao.findEmpByPage(estatus,page,length,realname);
    }

    public int SelectComt(int estatus,String realname){
        return dao.SelectComt(estatus,realname);
    }

    public int deleteUser(int eid ,int estatus){
        return dao.deleteUser(eid,estatus);
    }

    public int addUser(employee e){
        return dao.addUser(e);
    }

    public List<depart> addUserFindInfo(int dstatus){
        return dao.addUserFindInfo(dstatus);
    }
    public employee findUserAndDepts(@Param("eid") int eid){
        return dao.findUserAndDepts(eid);
    }
    public int editUser(employee emp){
        return dao.editUser(emp);
    }
}

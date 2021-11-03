package com.controller;

import com.entity.depart;
import com.service.departService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class departController {
    @Autowired
    private departService service;

    /**
    * 查询
    * */
    @RequestMapping(value = "/findAllDept",method = RequestMethod.GET)
    public String findAllDept(int dstatus, HttpSession session){
        List<depart> depart=service.selectDdpart(dstatus);
            session.setAttribute("dep",depart);
            return "depart.jsp";

    }

    /**
     * 新增
     */
    @RequestMapping(value = "/insertDepart",method = RequestMethod.GET)
    public String insertDepart(String dname, String duty,HttpSession session){
        int i=  service.insertDepart(dname,duty);
        session.removeAttribute("dep");
        return "/findAllDept?dstatus=0";
    }

    /**id查询

     */
    @RequestMapping("/findDeptById")
    public String selectDepartById(int did, Model model){
        depart d=service.selectDepartById(did);
        model.addAttribute("d",d);
        return "editDepart.jsp";

    }
    /**
     *修改*/
    @RequestMapping(value = "/depdateDepartp",method = RequestMethod.GET)
    public String depdateDepartp(depart depart,HttpSession session){
        int i= service.updateDeprtp(depart);
        session.removeAttribute("dep");
        return "/findAllDept?dstatus=0";
    }

    /**
     *
     * 状态修改*/
    @RequestMapping("deleteDepart")
    public String deleteDepart(depart depart,HttpSession session){
        int i=service.deleteDepart(depart);
        session.removeAttribute("dep");
        return "/findAllDept?dstatus=0";
    }

}

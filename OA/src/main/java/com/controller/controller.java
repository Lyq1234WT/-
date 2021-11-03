package com.controller;

import com.entity.depart;
import com.entity.empPcn;
import com.entity.employee;
import com.service.departService;
import com.service.service;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.regex.Pattern;

@Controller
public class controller {

    @Autowired
    private service service;


    @Autowired
    private departService s;
    /**登录
     *
     *
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String ename, String epass,  HttpServletRequest request){
        employee emp= service.login(ename,epass);

        List<employee> employee=service.select();
        empPcn e=new empPcn();
        if (emp!=null){

                HttpSession session= request.getSession();
                session.setAttribute("emp",emp);
                session.setAttribute("employee",employee);
                return "index.jsp";
            
        }
        return "login.jsp";
    }

    /*退出登录 */
    @RequestMapping(value = "/screen",method = RequestMethod.GET)
    public String screen(HttpServletRequest request){
        HttpSession session= request.getSession();
        session.removeAttribute("emp");
        return "login.jsp";
    }
    //修改密码
    @RequestMapping("/updatePwd")
    @ResponseBody
    public  String updatePwd(String password,HttpSession session){
        if (password != null && password != ""){
            String reg="^[A-Za-z0-9]+$";
            if (Pattern.matches(reg,password)){
                employee employee= (employee) session.getAttribute("emp");
                employee.setEpass(password);
                int i=service.updatePwd(employee);
                if (i>0){
                    return "true";
                }else {
                    return "flase";
                }
            }else{
                return "false";
            }
        }else{
            return "false";
        }
    }

    //查询员工
    @RequestMapping("findEmpByPage")
    public  String findEmpByPage(int estatus, int page, int length, String realname, Model m){
        int totalLine = service.SelectComt(estatus,realname);
        int totaPage = totalLine % length == 0 ? totalLine / length : totalLine / length + 1;
        List<employee> emps=service.findEmpByPage(estatus,(page-1)*length,length,realname);
        m.addAttribute("totalLine",totalLine);
        m.addAttribute("totalPage",totaPage);
        m.addAttribute("emps",emps);
        m.addAttribute("page",page);
        m.addAttribute("estatus",estatus);
        return "user.jsp";
    }

    //修改员工状态
    @RequestMapping("deleteUser")
    public String deleteUser(int eid,int  estatus,HttpSession session){
        service.deleteUser(eid,estatus);
        return "findEmpByPage?page=1&length=4&estatus=0";
    }

    //
    @RequestMapping("addUserFindInfo")
    public String addUserFindInfo(int dstatus,Model m){
        List<depart> departs=service.addUserFindInfo(dstatus);
        m.addAttribute("depts",departs);
        return "addUser.jsp";
    }
    //新增
    @RequestMapping("addUser")
    public String addUser(employee e){
        depart d=s.selectDepartById(e.getDid());
        e.setEpass("123456");
        e.setDname(d.getDname());
        service.addUser(e);
        return "redirect:/findEmpByPage?page=1&length=4&estatus=0";
    }
    //ID查询
    @RequestMapping("findUserAndDepts")
    public String findUserAndDepts(int eid,Model m){
        List<depart> departs=service.addUserFindInfo(0);
        m.addAttribute("depts",departs);
        employee e=service.findUserAndDepts(eid);
        m.addAttribute("editEmp",e);
        return "editUser.jsp";
    }
    //修改emp
    @RequestMapping("editUser")
    public  String editUer(employee emp){
        depart d=s.selectDepartById(emp.getDid());
        emp.setDname(d.getDname());
        int i= service.editUser(emp);
        return "redirect:/findEmpByPage?page=1&length=4&estatus=0";
    }

}

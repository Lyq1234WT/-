package com.controller;

import com.entity.NoteVo;
import com.entity.employee;
import com.entity.note;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.notService;
import com.service.service;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

@Controller
public class noteController {
    @Autowired
    private notService noteService;

    @Autowired
    private service s;
    /**
     * 查询请假信息
     * @param model
     * @param session
     * @param page
     * @param length
     * @param type
     * @param eid
     * @return
     */
    @RequestMapping("/findNoteByPage")
    public String findNoteByPage(Model model,HttpSession session, int page, int length, int type, int eid){
        PageHelper.startPage(page,length);
        model.addAttribute("type",type);
        if (type == 0){
            List<note> notes = noteService.findByNotePage(eid);
            PageInfo<note> pageInfo = new PageInfo<>(notes);
            model.addAttribute("pageInfo",pageInfo);
        }else {
            //获取当前登录账户的用户信息
            employee emp = (employee) session.getAttribute("emp");
            //通过当前账户权限查询信息
            List<Integer> ids = noteService.findIdsByDid(emp.getDid(),emp.getPosition());
            //根据获取到的did和type拿到对应的请假记录
            List<note> notes = noteService.findNoteByIds(ids,type);
            List<NoteVo> noteVos = copyBean(notes);
            PageInfo pageInfo = new PageInfo(noteVos);
            model.addAttribute("pageInfo",pageInfo);
        }
        return "leave.jsp";
    }

    /**
     * 存储vo
     * @param notes
     * @return
     */
    private List<NoteVo> copyBean(List<note> notes){
        List<NoteVo> noteVos = new ArrayList<>();
        for (note note : notes){
            employee employee = s.findUserAndDepts(note.getEid());
            NoteVo noteVo = new NoteVo();
            BeanUtils.copyProperties(note,noteVo);
            noteVo.setRealName(employee.getRealname());

            noteVos.add(noteVo);
        }
        return noteVos;
    }

    /**
     * 新增申请信息
     * @param note
     * @return
     */
    @RequestMapping("/addNote")
    public String addNote(note note){
        noteService.addNote(note);
        return "redirect:/findNoteByPage?page=1&length=4&type=0&eid=1";
    }

    /**
     * 同意、打回、不同意
     * @param nid
     * @param estatus
     * @param eid
     * @return
     */
    @RequestMapping("/updateNoteEstatus")
    public String updateNoteEstatus(int nid,int estatus,int eid){
        /**
         * 同意estatus = 1
         * 打回estatus = 3
         * 不同意 eStatus = 2
         */
        noteService.updateNoteEstatus(nid,estatus);
        return "redirect:/findNoteByPage?page=1&length=4&type=0&eid=1";
    }

    /**
     * 打开编辑弹窗显示内容
     * @param nid
     * @param model
     * @return
     */
    @RequestMapping("/findNoteByNid")
    public String findNoteByNid(int nid, Model model){
        //select * from employee e inner join note n on e.eid = n.eid where n.nid = #{nid};
        //select * from note where nid = #{nid}
        employee emp = noteService.findEmpNoteByNid(nid);
        note note = noteService.findNoteByNid(nid);
        model.addAttribute("emp",emp);
        model.addAttribute("note",note);

        return "editLeave.jsp";
    }

    /**
     * 编辑修改内容
     * @param note
     * @return
     */
    @RequestMapping("/editNote")
    public String editNote(note note){
        noteService.editNote(note);
        return "redirect:/findNoteByPage?page=1&length=4&type=0&eid=1";
    }


}

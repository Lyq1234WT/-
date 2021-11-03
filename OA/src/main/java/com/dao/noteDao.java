package com.dao;

import com.entity.employee;
import com.entity.note;
import org.apache.ibatis.annotations.*;

import java.util.HashMap;
import java.util.List;

public interface noteDao {
    /**
     *  findByNotePage 查询全部信息
     * @param eid
     * @return
     */
    @Select("select * from note where eid=#{eid}")
    List<note> findByNotePage(int eid);

    /**
     * 通过当前账户权限查询信息
     * @param map
     * @return
     */


    @Select("select eid from employee where position=#{position}")
    List<Integer> findIdsByDid(HashMap<String,Object> map);

    @Select(" select eid from employee where position != 0")
    List<Integer> findIdsByDidPo(HashMap<String,Object> map);


    @Select({"<script>",
            "select * from note where eid in",
            "<foreach item='id' collection='ids' open='(' separator =',' close= ')'>",
            "#{id}",
            "</foreach>",
            "AND",
            "<if test='type==1'>",
            "estatus=0",
            "</if>",
            "<if test='type==2'>",
            "estatus!=0",
            "</if>",
            "</script>"})
    List<note> findNoteByIds(HashMap<String,Object> map);


    @Update("update note set estatus = #{eStatus} where nid = #{nid}")
    /**
     * 同意、打回、不同意
     * @param map
     * @return
     */
    int updateNoteEstatus(HashMap<String,Object> map);

    @Select(" select * from employee e\n" +
            "            inner join note n\n" +
            "                on e.eid = n.eid where n.nid = #{nid}")
    employee findEmpNoteByNid(@Param("nid") int nid);

    @Select("select * from note where nid = #{nid}")
    /**
     * 根据nid查询Note信息
     * @param nid
     * @return
     */
    note findNoteByNid(@Param("nid") int nid);


    @Update("update note set title=#{title},context=#{context},startdate=#{startDate},enddate=#{endDate},`length`=#{length} where nid=#{nid}")
    /**
     * 修改信息
     * @param note
     * @return
     */
    @Options(useGeneratedKeys = false)
    int editNote(note note);

    @Insert("insert into note(title,context,startdate,enddate,`length`,subdate,estatus,eid) values(#{title},#{context},#{startDate},#{endDate},#{length},now(),0,#{eid});")
    /**
     * addNote 申请请假
     * @param note
     * @return
     */
    @Options(useGeneratedKeys = false)
    int addNote(note note);

}

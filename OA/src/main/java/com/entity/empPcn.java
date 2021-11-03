package com.entity;

import com.entity.employee;
import com.entity.position;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class empPcn {
    //判断name和pass长度
    public boolean judegeLength(String ename,String epass){

        if(ename.trim().length()>=2 && ename.trim().length()<=20 && epass.trim().length()>=2 && epass.trim().length()<=20){
            if(this.judgePattern(ename) && this.judgePattern(epass)){
                return true;
            }
        }
        return false;
    }

    //判断是否为字母或数字
    public boolean judgePattern(String value){
        boolean flag1= Pattern.matches("[0-9]*", value);
        boolean flag2=Pattern.matches("[a-zA-Z]+$", value);
        if(flag1 || flag2){
            return true;
        }
        return false;
    }

    //职位转换成文字
    public List<position> positionCon(List<employee> empList){
        List<position> postList=new ArrayList<position>();
        int pos=0;
        for(int i=0; i<empList.size();i++){
            pos=empList.get(i).getPosition();
            switch (pos){
                case 0:
                    postList.add(new position(pos,"总裁"));
                    break;
                case 1:
                    postList.add(new position(pos,"经理"));
                    break;
                case 2:
                    postList.add(new position(pos,"普通员工"));
                    break;
            }
        }
        return postList;
    }
}

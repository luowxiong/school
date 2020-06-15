package com.luowx.controller;

import com.luowx.entity.Course;
import com.luowx.entity.Grade;
import com.luowx.service.ClassesService;
import com.luowx.service.GradeService;
import com.luowx.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
public class GradeController {

    @Autowired
    private GradeService gradeService;

    @RequestMapping("/getGradeByUserId")
    public ResultVO getGradeByUserId(String userId){
        return gradeService.getGradeByUserId(userId);
    }

    @RequestMapping("/getGradeListByCno")
    public ResultVO getGradeListByCno(Integer cno){
        return gradeService.getGradeListByCno(cno);
    }

    @RequestMapping("/saveGrade")
    public ResultVO saveGrade(Integer cno, Integer sno, Integer userId,String username){
        return gradeService.saveGrade(cno,sno,userId,username);
    }

    @RequestMapping("/deleteById")
    public ResultVO deleteById(Integer id){
        return gradeService.deleteById(id);
    }

    @RequestMapping("/getGradeList")
    public ResultVO getGradeList(HttpServletRequest request){

        Grade grade = new Grade();
        String userId = request.getParameter("userId");
        String username = request.getParameter("username");
        String cno = request.getParameter("cno");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");

        if (userId != null && userId != ""){
            grade.setUserId(Integer.parseInt(userId));
        }
        grade.setUsername(username);
        if (cno != null && cno != ""){
            grade.setCno(Integer.parseInt(cno));
        }
        if (startTime != null && startTime != ""){
            grade.setStartTime(startTime + " 00:00:00.0");
        }
        if (endTime != null && endTime != ""){
            grade.setEndTime(endTime + " 23:59:59.0");
        }

        System.out.println(grade);

        return gradeService.getGradeList(grade);
    }

    @RequestMapping("/getGrade")
    public ResultVO getGrade(){

        return gradeService.getGrade();
    }

}

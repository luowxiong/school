package com.luowx.controller;

import com.luowx.service.ClassesService;
import com.luowx.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ClassesController {

    @Autowired
    private ClassesService classesService;

    @RequestMapping("/getClassesList")
    public ResultVO getClassesList(){
        return classesService.getClassesList();
    }

    @RequestMapping("/getClassesById")
    public ResultVO getClassesById(Integer classId){
        return classesService.getClassesById(classId);
    }

    @RequestMapping("/getStuByClassId")
    public ResultVO getStuByClassId(Integer classId){
        return classesService.getStuByClassId(classId);
    }

    @RequestMapping("/updateClassNameAndUsername")
    public ResultVO updateClassNameAndUsername(String className, Integer classId, Integer userId, String username){
        return classesService.updateClassNameAndUsername(className, classId, userId, username);
    }

    @RequestMapping("/selectClassesList")
    public ResultVO selectClassesList(){
        return classesService.selectClassesList();
    }
}

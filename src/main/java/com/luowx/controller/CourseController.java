package com.luowx.controller;

import com.luowx.entity.Course;
import com.luowx.service.CourseService;
import com.luowx.service.GradeService;
import com.luowx.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CourseController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("/getCourseListById")
    public ResultVO getCourseListById(Integer userId){
        return courseService.getCourseListById(userId);
    }

    @RequestMapping("/getCourseList")
    public ResultVO getCourseList(){
        return courseService.getCourseList();
    }

    @RequestMapping("/getCourseListByusername")
    public ResultVO getCourseListByusername(String username){
        return courseService.getCourseListByusername(username);
    }

    @RequestMapping("/deleteCourseByCno")
    public ResultVO deleteCourseByCno(Integer cno){
        return courseService.deleteCourseByCno(cno);
    }

    @RequestMapping("/getCourseByCno")
    public ResultVO getCourseByCno(Integer cno){
        return courseService.getCourseByCno(cno);
    }

    @RequestMapping("/updateByCid")
    public ResultVO updateByCid(Course course){
        return courseService.updateByCid(course);
    }

    @RequestMapping("/saveCourse")
    public ResultVO saveCourse(Course course){
        return courseService.saveCourse(course);
    }
}

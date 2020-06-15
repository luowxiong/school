package com.luowx.service;

import com.luowx.entity.Course;
import com.luowx.vo.ResultVO;




public interface CourseService {

    ResultVO getCourseListById(Integer userId);

    ResultVO getCourseList();

    ResultVO getCourseListByusername(String username);

    ResultVO deleteCourseByCno(Integer cno);

    ResultVO getCourseByCno(Integer cno);

    ResultVO updateByCid(Course course);

    ResultVO saveCourse(Course course);

}

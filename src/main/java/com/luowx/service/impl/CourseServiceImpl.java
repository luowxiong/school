package com.luowx.service.impl;


import com.luowx.entity.Course;
import com.luowx.entity.User;
import com.luowx.mapper.CourseMapper;
import com.luowx.mapper.UserMapper;
import com.luowx.service.CourseService;
import com.luowx.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public ResultVO getCourseListById(Integer userId) {
        return ResultVO.success(courseMapper.getCourseListById(userId));
    }

    @Override
    public ResultVO getCourseList() {
        return ResultVO.success(courseMapper.getCourseList());
    }

    @Override
    public ResultVO getCourseListByusername(String username) {
        return ResultVO.success(courseMapper.getCourseListByusername(username));
    }

    @Override
    public ResultVO deleteCourseByCno(Integer cno) {
        return ResultVO.success(courseMapper.deleteCourseByCno(cno));
    }

    @Override
    public ResultVO getCourseByCno(Integer cno) {
        Course course = courseMapper.getCourseByCno(cno);
        List<User> userList = userMapper.getTeachersList();
        course.setUser(userList);
        return ResultVO.success(course);
    }

    @Override
    public ResultVO updateByCid(Course course) {
        return ResultVO.success(courseMapper.updateByCid(course));
    }

    @Override
    public ResultVO saveCourse(Course course) {
        if (course.getCno() != null){
            return ResultVO.success(courseMapper.saveCourse(course));
        }else {
            return ResultVO.error(1, "课程号不能为空");
        }
    }
}

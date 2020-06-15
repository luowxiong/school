package com.luowx.mapper;


import com.luowx.entity.Course;

import java.util.List;

public interface CourseMapper {

    List<Course> getCourseListById(Integer userId);

    List<Course> getCourseList();

    List<Course> getCourseListByusername(String username);

    Integer deleteCourseByCno(Integer cno);

    Course getCourseByCno(Integer cno);

    Integer updateByCid(Course course);

    Integer saveCourse(Course course);
}

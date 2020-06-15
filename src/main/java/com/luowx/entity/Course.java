package com.luowx.entity;

import lombok.Data;
import lombok.ToString;

import java.util.List;

@Data
@ToString
/**
 * 课程表
 */
public class Course {

    private Integer cId;

    /**
     * 课程号
     */
    private Integer cno;

    /**
     * 课程名
     */
    private String cname;

    /**
     * 教师姓名
     */

    private String username;

    /**
     * 上课时间
     */
    private String schoolTime;

    /**
     * 上课地点
     */
    private String site;

    private Grade grade;

    /**
     * 学年+学期
     */
    private String semesters;

    private List<User> user;
}

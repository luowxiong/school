package com.luowx.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Value;

import java.util.Date;

@Data
@ToString
/**
 * 成绩表
 */
public class Grade {

    private Integer id;

    /**
     * 课程号
     */
    private Integer cno;

    /**
     * 分数
     */
    private Integer sno;

    /**
     * 学生学号
     */
    private Integer userId;

    /**
     * 学生姓名
     */

    private String username;

//    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
    private String createTime;

    private Course course;

    private User user;

    /**
     * 学期开始时间
     */
//    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
    private String startTime;

    /**
     * 学期结束时间
     */
//    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
    private String endTime;

}

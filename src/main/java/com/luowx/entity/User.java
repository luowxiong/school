package com.luowx.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class User {

    /**
     * 主键id
     */
    private Integer userId;


    /**
     * 账号
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 角色  0.教务处  1.班主任  2.任课老师 3.学生
     */
    private Integer role;
    private String sex;

    /**
     * 找回密码的问题
     */
    private String question;

    /**
     * 找回密码的答案
     */
    private String answer;

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private Integer classId;

    private Classes classes;

}

package com.luowx.entity;

import java.util.List;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Classes {

    /**
     * 班级号
     */
    private Integer classId;

    /**
     * 班级名
     */
    private String className;

    private Integer stuCount;

    private String headmaster;

    private List<User> user;
}

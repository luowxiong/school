package com.luowx.mapper;

import com.luowx.entity.Grade;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GradeMapper {

    List<Grade> getGradeByUserId(String userId);

    List<Grade> getGradeListByCno(Integer cno);

    Integer saveGrade(@Param("cno") Integer cno, @Param("sno") Integer sno, @Param("userId") Integer userId, @Param("username") String username);

    Integer deleteById(Integer id);

    List<Grade> getGradeList(Grade grade);
    List<Grade> getGrade();

}

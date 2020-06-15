package com.luowx.mapper;


import com.luowx.entity.Classes;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ClassesMapper {

    List<Classes> getClassesList();

    Classes getClassesById(Integer classId);

    Integer updateClassName(@Param("className") String className, @Param("classId") Integer classId);

    List<Classes> selectClassesList();

}

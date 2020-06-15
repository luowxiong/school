package com.luowx.service;

import com.luowx.entity.Classes;
import com.luowx.entity.User;
import com.luowx.vo.ResultVO;
import java.util.List;

public interface ClassesService {

    ResultVO getClassesList();

    ResultVO getClassesById(Integer classId);

    ResultVO getStuByClassId(Integer classId);

    ResultVO updateClassNameAndUsername(String className, Integer classId, Integer userId, String username);

    ResultVO selectClassesList();

}

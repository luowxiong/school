package com.luowx.service;

import com.luowx.entity.Grade;
import com.luowx.vo.ResultVO;


public interface GradeService {

    ResultVO getGradeByUserId(String userId);

    ResultVO getGradeListByCno(Integer cno);

    ResultVO saveGrade(Integer cno, Integer sno, Integer userId, String username);

    ResultVO deleteById(Integer id);

    ResultVO getGradeList(Grade grade);
    ResultVO getGrade();

}

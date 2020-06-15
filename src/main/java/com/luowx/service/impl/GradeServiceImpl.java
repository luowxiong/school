package com.luowx.service.impl;


import com.luowx.entity.Grade;
import com.luowx.entity.User;
import com.luowx.mapper.GradeMapper;
import com.luowx.mapper.UserMapper;
import com.luowx.service.GradeService;
import com.luowx.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class GradeServiceImpl implements GradeService {

    @Autowired
    private GradeMapper gradeMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public ResultVO getGradeByUserId(String userId) {

        return ResultVO.success(gradeMapper.getGradeByUserId(userId));
    }

    @Override
    public ResultVO getGradeListByCno(Integer cno) {
        return ResultVO.success(gradeMapper.getGradeListByCno(cno));
    }

    @Override
    public ResultVO saveGrade(Integer cno, Integer sno, Integer userId, String username) {
        User user = userMapper.selectStuByUserId(userId);
        if (user != null){
            return ResultVO.success(gradeMapper.saveGrade(cno,sno,userId,username));
        }else {
            return ResultVO.error(1, "查无该学生，请认真核对学号并重新输入!");
        }

    }

    @Override
    public ResultVO deleteById(Integer id) {
        return ResultVO.success(gradeMapper.deleteById(id));
    }

    @Override
    public ResultVO getGradeList(Grade grade) {
        return ResultVO.success(gradeMapper.getGradeList(grade));
    }

    @Override
    public ResultVO getGrade() {
        return ResultVO.success(gradeMapper.getGrade());
    }
}

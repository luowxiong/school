package com.luowx.service.impl;

import com.luowx.entity.Classes;
import com.luowx.entity.User;
import com.luowx.mapper.ClassesMapper;
import com.luowx.mapper.UserMapper;
import com.luowx.service.ClassesService;
import com.luowx.vo.ResultVO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClassesServiceImpl implements ClassesService {

    @Autowired
    private ClassesMapper classesMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public ResultVO getClassesList() {
        List<Classes> classesList = classesMapper.getClassesList();
        List<User> userList = userMapper.getHeadmasterList();
        for (Classes classes : classesList) {
            for (User user : userList) {
                if (classes.getClassId() == user.getClassId()){
                    classes.setHeadmaster(user.getUsername());
                }
            }
        }

        return ResultVO.success(classesList);
    }

    @Override
    public ResultVO getClassesById(Integer classId) {

        Classes classes = classesMapper.getClassesById(classId);
        User user = userMapper.getHeadmaster(classId);
        classes.setHeadmaster(user.getUsername());
        List<User> userList = userMapper.getTeacherList();
        classes.setUser(userList);
        return ResultVO.success(classes);
    }

    @Override
    public ResultVO getStuByClassId(Integer classId) {

        Classes classes = classesMapper.getClassesById(classId);
        User user = userMapper.getHeadmaster(classId);
        classes.setHeadmaster(user.getUsername());
        List<User> userList = userMapper.getStuByClassId(classId);
        classes.setUser(userList);
        return ResultVO.success(classes);
    }

    @Override
    public ResultVO updateClassNameAndUsername(String className, Integer classId, Integer userId, String username) {

        userMapper.updateByBefore(username);
        userMapper.updateByafter(userId, classId);
        classesMapper.updateClassName(className, classId);


        return ResultVO.success();
    }

    @Override
    public ResultVO selectClassesList() {
        return ResultVO.success(classesMapper.selectClassesList());
    }


}

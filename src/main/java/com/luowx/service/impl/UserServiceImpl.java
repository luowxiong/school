package com.luowx.service.impl;

import com.luowx.entity.ItemPriceExport;
import com.luowx.entity.User;
import com.luowx.mapper.UserMapper;
import com.luowx.service.UserService;
import com.luowx.vo.ResultVO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;


    @Override
    public ResultVO getUserList() {
        return ResultVO.success(userMapper.getUserList());
    }

    @Override
    public ResultVO addUserList(User user, HttpServletRequest httpServletRequest) {
        String username = httpServletRequest.getParameter("username");
        String password = httpServletRequest.getParameter("password");
        Integer role = Integer.parseInt(httpServletRequest.getParameter("role"));
        Integer classId = Integer.parseInt(httpServletRequest.getParameter("classId"));
        String sex = httpServletRequest.getParameter("sex");
        String question = httpServletRequest.getParameter("question");
        String answer = httpServletRequest.getParameter("answer");

        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role);
        user.setClassId(classId);
        user.setSex(sex);
        user.setQuestion(question);
        user.setAnswer(answer);

        return ResultVO.success(userMapper.addUserList(user));
    }

    @Override
    public ResultVO getUserByname(Integer userId, String password, HttpSession session, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        String remember = httpServletRequest.getParameter("remember");
        String verifyCode = httpServletRequest.getParameter("verifyCode");
        String sessionVerifyCode = (String) session.getAttribute("verifyCodeValue");
        if (userId != null && userId != 0){
            User user = userMapper.getUserAndClassesByname(userId);
            if (user != null){
            User headmaster = userMapper.getHeadmaster(user.getClassId());
            user.getClasses().setHeadmaster(headmaster.getUsername());
            if (verifyCode != null && verifyCode.equalsIgnoreCase(sessionVerifyCode)){

            if (user != null && user.getPassword().equals(password)){
                session.setAttribute("user", user);
                if (remember != null){
                    String userId1 = Integer.toString(userId);
                    Cookie cookieUser = new Cookie("userId", userId1);
                    Cookie cookiePass = new Cookie("password", password);
                    cookieUser.setMaxAge(60 * 60 * 24);
                    cookiePass.setMaxAge(60 * 60 * 24);
                    httpServletResponse.addCookie(cookieUser);
                    httpServletResponse.addCookie(cookiePass);
                }
                return ResultVO.success(user);
            } else {
                return ResultVO.error(1, "用户名或密码错误");
            }
        }
        return ResultVO.error(2, "验证码错误");
            }else {
                return ResultVO.error(1, "用户名或密码错误");
            }
        }
        return ResultVO.error(3, "用户名或密码不能为空");
    }

    @Override
    public ResultVO selectUserByname(String username) {
        if (username != null && username != ""){
            User user = userMapper.getUserByname(username);
            if (user.getUsername().equals(username)){
                return ResultVO.error(2, "用户名已存在");
            }
        }
        return ResultVO.success();
    }

    @Override
    public ResultVO updatePassword(String password, String question, String answer, Integer userId) {

        if (password != null && password != "" && question != null && question != "" && answer != null && answer != ""){
            return ResultVO.success(userMapper.updatePassword(password, question, answer, userId));
        } else {
            return ResultVO.error(1, "修改失败，请检查密码/密保是否为空");
        }

    }

    @Override
    public ResultVO selectUserIdIsnull(Integer userId, HttpSession session) {
        if (userId != null){
            User user = userMapper.selectUserIdIsnull(userId);
            if (user != null){
                session.setAttribute("user", user);
                session.setAttribute("forgotId", user.getUserId());
                session.setAttribute("question", user.getQuestion());
                return ResultVO.success(user);
            }else {
                return ResultVO.error(1, "查无此用户,请重新输入");
            }
        }
        return ResultVO.error(1, "学号不能为空");
    }

    @Override
    public ResultVO selectAnswerById(Integer userId, String answer) {

        User user = userMapper.selectUserIdIsnull(userId);
        if (answer != null && answer != ""){
            if (user.getAnswer().equals(answer)){
                return ResultVO.success();
            }
            return ResultVO.error(1, "密保答案不正确，请重新输入");
        }
        return ResultVO.error(1, "密保答案不能为空，请重新输入");
    }

    @Override
    public ResultVO updatePass(String password, Integer userId) {

        return ResultVO.success(userMapper.updatePass(password, userId));
    }

    @Override
    public ResultVO updatePassByUserId(Integer userId) {
        return ResultVO.success(userMapper.updatePassByUserId(userId));
    }

    @Override
    public ResultVO getTeachersList() {
        return ResultVO.success(userMapper.getTeachersList());
    }

    @Override
    public ResultVO addUser(ItemPriceExport itemPriceExport) {
        return ResultVO.success(userMapper.addUser(itemPriceExport));
    }

    @Override
    public ResultVO updateClassesByUserId(Integer classId, Integer userId) {
        return ResultVO.success(userMapper.updateClassesByUserId(classId, userId));
    }

    @Override
    public ResultVO updateUser(Integer userId, String username, String sex) {
        return ResultVO.success(userMapper.updateUser(userId, username, sex));
    }


}

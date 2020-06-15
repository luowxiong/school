package com.luowx.service;

import com.luowx.entity.ItemPriceExport;
import com.luowx.entity.User;
import com.luowx.vo.ResultVO;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;


public interface UserService {

    ResultVO getUserList();

    ResultVO addUserList(User user, HttpServletRequest httpServletRequest);

    ResultVO getUserByname(Integer userId, String password, HttpSession session, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse);

    ResultVO selectUserByname(String username);

    ResultVO updatePassword(@Param("password") String password, @Param("question") String question, @Param("answer") String answer, @Param("userId") Integer userId);

    ResultVO selectUserIdIsnull(Integer userId, HttpSession session);

    ResultVO selectAnswerById(Integer userId, String answer);

    ResultVO updatePass(String password, Integer userId);

    ResultVO updatePassByUserId(Integer userId);

    ResultVO getTeachersList();

    ResultVO addUser(ItemPriceExport itemPriceExport);

    ResultVO updateClassesByUserId(Integer classId, Integer userId);

    ResultVO updateUser(Integer userId, String username, String sex);

}

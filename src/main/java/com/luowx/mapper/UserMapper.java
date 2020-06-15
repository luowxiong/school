package com.luowx.mapper;

import com.luowx.entity.ItemPriceExport;
import com.luowx.entity.User;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    List<User> getUserList();

    List<User> getHeadmasterList();

    User getHeadmaster(Integer classId);

    Integer addUserList(User user);

    Integer addUser(ItemPriceExport itemPriceExport);

    User getUserByname(String username);

    User getUserAndClassesByname(Integer userId);

    List<User> getTeacherList();

    List<User> getTeachersList();

    List<User> getStuByClassId(Integer classId);

    Integer updateByafter(@Param("userId") Integer userId, @Param("classId") Integer classId);

    Integer updateByBefore(@Param("username") String username);

    Integer updatePassword(@Param("password") String password,@Param("question") String question,@Param("answer") String answer,@Param("userId") Integer userId);

    User selectUserIdIsnull(Integer userId);

    User selectStuByUserId(Integer userId);

    Integer updatePass(@Param("password") String password, @Param("userId") Integer userId);

    Integer updatePassByUserId(Integer userId);

    Integer updateClassesByUserId(@Param("classId") Integer classId, @Param("userId") Integer userId);

    Integer updateUser(@Param("userId") Integer userId, @Param("username") String username, @Param("sex") String sex);
}

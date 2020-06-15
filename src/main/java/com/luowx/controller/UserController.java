package com.luowx.controller;

import com.luowx.entity.User;
import com.luowx.service.UserService;
import com.luowx.utils.ImportExcel;
import com.luowx.vo.ResultVO;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.awt.*;
import java.awt.List;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/getUserList")
    public ResultVO getUserList(){
        return userService.getUserList();
    }

    @RequestMapping("/addUserList")
    public ResultVO addUserList(User user, HttpServletRequest httpServletRequest){

        return userService.addUserList(user, httpServletRequest);
    }

    //登录
    @RequestMapping("/getUserByname")
    public ResultVO getUserByname(Integer userId, String password, HttpSession session, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse){
        return userService.getUserByname(userId, password, session, httpServletRequest, httpServletResponse);
    }

    @RequestMapping("/selectUserByname")
    public ResultVO selectUserByname(String username){
        return userService.selectUserByname(username);
    }

    @RequestMapping("/updatePassword")
    public ResultVO updatePassword(String password, String question, String answer, Integer userId) {
        return userService.updatePassword(password, question, answer, userId);
    }

    @RequestMapping("/selectUserIdIsnull")
    public ResultVO selectUserIdIsnull(Integer userId, HttpSession session){
        return userService.selectUserIdIsnull(userId, session);
    }

    @RequestMapping("/selectAnswerById")
    public ResultVO selectAnswerById(Integer userId, String answer){
        return userService.selectAnswerById(userId, answer);
    }

    @RequestMapping("/updatePass")
    public ResultVO updatePass(String password, Integer userId){
        return userService.updatePass(password, userId);
    }

    @RequestMapping("/updatePassByUserId")
    public ResultVO updatePassByUserId(Integer userId){
        return userService.updatePassByUserId(userId);
    }

    @RequestMapping("/getTeachersList")
    public ResultVO getTeachersList(){
        return userService.getTeachersList();
    }

    @RequestMapping("/logout")
    public void logout(HttpSession session){
        session.removeAttribute("user");
    }

    @RequestMapping("/updateClassesByUserId")
    public ResultVO updateClassesByUserId(Integer classId, Integer userId){
        return userService.updateClassesByUserId(classId, userId);
    }

    @RequestMapping("/updateUser")
    public ResultVO updateUser(Integer userId, String username, String sex){
        return userService.updateUser(userId, username, sex);
    }


    /**
     * 文件上传和下载
     * @param file
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/fileUpLoad")
    public ResultVO fileUpLoad(MultipartFile file, HttpServletRequest request) throws IOException {
        //file接收上传的文件
        System.out.println(file);
        //下载到本地
        //文件名
        String fileName = file.getOriginalFilename();
        //本地项目路径
        String realURL = request.getServletContext().getRealPath("/");
        //为文件重命名
        String filePath = realURL + UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
        System.out.println(filePath);
        //IO下载到本地
        File f = new File(filePath);
        file.transferTo(f);
        return ResultVO.success();
    }






    /* 获取校验码 */
    @RequestMapping("/getVerifyCode")
    public void generate(HttpServletResponse response, HttpSession session) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        String verifyCodeValue = drawImg(output);
        // 将校验码保存到session中
        session.setAttribute("verifyCodeValue", verifyCodeValue);

        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
        } catch (IOException e) {

            e.printStackTrace();

        }
    }

    /* 绘制验证码 */
    private String drawImg(ByteArrayOutputStream output) {
        String code = "";
        // 随机产生4个字符
        for (int i = 0; i < 4; i++) {
            code += randomChar();
        }
        int width = 70;
        int height = 25;
        BufferedImage bi = new BufferedImage(width, height,
                BufferedImage.TYPE_3BYTE_BGR);
        Font font = new Font("Times New Roman", Font.PLAIN, 20);
        // 调用Graphics2D绘画验证码
        Graphics2D g = bi.createGraphics();
        g.setFont(font);
        Color color = new Color(66, 2, 82);
        g.setColor(color);
        g.setBackground(new Color(226, 226, 240));
        g.clearRect(0, 0, width, height);
        FontRenderContext context = g.getFontRenderContext();
        Rectangle2D bounds = font.getStringBounds(code, context);
        double x = (width - bounds.getWidth()) / 2;
        double y = (height - bounds.getHeight()) / 2;
        double ascent = bounds.getY();
        double baseY = y - ascent;
        g.drawString(code, (int) x, (int) baseY);
        g.dispose();
        try {
            ImageIO.write(bi, "jpg", output);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return code;
    }

    /* 获取随机参数 */
    private char randomChar() {
        Random r = new Random();
        String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
        return s.charAt(r.nextInt(s.length()));
    }


}

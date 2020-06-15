package com.luowx.entity;


import com.luowx.utils.ExcelField;

public class ItemPriceExport {

    private String username;

    private String password;

    private Integer role;

    private String sex;

    private Integer classId;

    private String question;

    private String answer;

    public ItemPriceExport() {
    }

    @ExcelField(title = "姓名", align = 2, sort = 10)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @ExcelField(title = "密码", align = 2, sort = 20)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @ExcelField(title = "角色", align = 2, sort = 30)
    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    @ExcelField(title = "性别", align = 2, sort = 40)
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @ExcelField(title = "班级", align = 2, sort = 50)
    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    @ExcelField(title = "密保问题", align = 2, sort = 60)
    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    @ExcelField(title = "密保答案", align = 2, sort = 70)
    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}

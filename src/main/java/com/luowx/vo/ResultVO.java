package com.luowx.vo;

import lombok.Data;

@Data
public class ResultVO {

    private Integer status;
    private String message;
    private Object data;

    public static ResultVO success() {
        ResultVO resultVO = new ResultVO();
        resultVO.setStatus(0);
        resultVO.setMessage("成功");
        return resultVO;
    }

    public static ResultVO success(String message, Object data) {
        ResultVO resultVO = new ResultVO();
        resultVO.setStatus(0);
        resultVO.setMessage(message);
        resultVO.setData(data);
        return resultVO;
    }

    public static ResultVO success(Object data) {
        ResultVO resultVO = new ResultVO();
        resultVO.setStatus(0);
        resultVO.setMessage("成功");
        resultVO.setData(data);
        return resultVO;
    }

    public static ResultVO error(Integer status, String message) {
        ResultVO resultVO = new ResultVO();
        resultVO.setStatus(status);
        resultVO.setMessage(message);
        return resultVO;
    }
}

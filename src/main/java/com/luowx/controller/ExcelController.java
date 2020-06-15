package com.luowx.controller;

import com.luowx.entity.ItemPriceExport;
import com.luowx.service.UserService;
import com.luowx.utils.ImportExcel;
import com.luowx.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
public class ExcelController {

    @Autowired
    private UserService userService;

    /**
     * excel导入接口
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping("/importExcel")
    public ResultVO importExcel(MultipartFile file) throws Exception {
        if (file != null){
            ImportExcel ei = new ImportExcel(file, 0, 0);
            List<ItemPriceExport> list = ei.getDataList(ItemPriceExport.class);
            try {
                if (list != null && list.size() > 0){
                    for (ItemPriceExport itemPriceExport : list) {
                        userService.addUser(itemPriceExport);
                    }
                    return ResultVO.success();
                }
            }catch (Exception e){
                return ResultVO.error(1, "导入失败,请重新导入！！！");
            }
        }
        return ResultVO.error(1, "导入文件不能为空");
    }

}

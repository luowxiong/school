package com.luowx.utils;

import org.apache.commons.io.FileUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;

public class PoiReadExcel {

    public static void main(String[] args) {

        // 引入需要解析的文件
        File file = new File("D:/student.xlsx");
        try {
            // 创建Excel 读取文件内容
            XSSFWorkbook workbook = new XSSFWorkbook(FileUtils.openInputStream(file));
            /**
             * 第一种方式读取Sheet页
             */
//            HSSFSheet sheet = workbook.getSheet("Sheet0");
            /**
             * 第二种方式读取Sheet页
             */
            XSSFSheet sheet = workbook.getSheetAt(0);
            int firstRowNum = 0;// 起始行第0行
            int lasrRowNum = sheet.getLastRowNum();// 一直读到最后一行
            for (int i = 0; i < lasrRowNum + 1; i++) {
                XSSFRow row = sheet.getRow(i);
                // 获取当前最后单元格列号
                int lastCellNum = row.getLastCellNum();
                for (int j = 0; j < lastCellNum; j++) {
                    row.getCell(j).setCellType(Cell.CELL_TYPE_STRING);
                    XSSFCell cell = row.getCell(j);
                    String value = cell.getStringCellValue();// 注意！ 如果Excel 里面的值是String 那么getStringCellValue 如果是其他类型 则需要修改
                    System.out.print(value + "  ");
                }
                System.out.println();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

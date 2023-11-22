package com.ruoyi.common.utils.file.parsing.excel;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.interfaces.Function2;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.*;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.function.Consumer;

/**
 * @description: EXCEL的 文件工具解析类
 */
@Service
public class ExcelParsingUtilImpl<T> implements ExcelParsingUtil<T> {

    /**
     *
     * @param sheet:        excel的每一个单元格
     * @param fun:          每一行对应的对象
     * @param titleLength:  标题行所占的行数  默认1
     * @return: java.util.List<org.apache.poi.ss.formula.functions.T>
     * @author: TheRaging
     * @date: 2023/5/18 9:18
     * @throws:
     */
    public  List<T> getSheetByIndex(Class<T> cla, Sheet sheet, Function2<String,Integer,T> fun, Consumer<T> con, int titleLength) throws Exception {

        /**
         *  循环获取每一行的数据
         */
        Iterator<Row> rows = sheet.rowIterator();
        Row row  ;
        List<T> list = new ArrayList<>();
        int j = 0;
        while (rows.hasNext()) {
            row = rows.next();
            if(j<titleLength){
                j++;
                continue;
            }
            // 获取单元格
            Iterator<Cell> cells = row.cellIterator();
            T t = cla.newInstance();
            for(int i =0;i<row.getPhysicalNumberOfCells();i++){
                row.getCell(i);
                String cellValue = getCellValue(row.getCell(i));
                // 函数式表达式  返回给 对应的下标的单元格数据
                t= fun.apply(cellValue,i,t);
            }
            if(!con.equals(null)){
                con.accept(t);
            }
            list.add(t);
        }
        return list;
    }


    public List<T> getSheetByIndex(Class<T> cla,Sheet sheet, Function2<String,Integer,T> fun, int titleLength) throws Exception {
        return this.getSheetByIndex(cla,sheet,fun,null,titleLength);
    };
    public List<T> getSheetByIndex(Class<T> cla, Sheet sheet, Function2<String,Integer,T> fun,Consumer<T> con) throws Exception {
        return this.getSheetByIndex(cla,sheet,fun,con,1);
    };

    /**
     *
     * @param sheet:  excel的每一个单元格
     * @param fun:    每一行对应的对象的具体处理
     * @return: java.util.List<org.apache.poi.ss.formula.functions.T>
     * @author: TheRaging
     * @date: 2023/5/18 9:17
     * @throws:
     */
    public  List<T> getSheetByIndex(Class<T> cla,Sheet sheet, Function2<String,Integer,T> fun ) throws Exception {
        return  this.getSheetByIndex(cla,sheet,fun,1);
    }



    /**
     * 获取cell中的值并返回String类型
     *
     * @param cell
     * @return String类型的cell值
     */
    public String getCellValue(Cell cell) {
        String cellValue = "";
        if (null != cell) {
            // 以下是判断数据的类型
            if (CellType.NUMERIC.equals(cell.getCellType())){
                      // 判断单元格的类型是否则NUMERIC类型
                    if (HSSFDateUtil.isCellDateFormatted(cell)) {// 判断是否为日期类型
                        Date date = cell.getDateCellValue();
                        //                      DateFormat formater = new SimpleDateFormat("yyyy/MM/dd HH:mm");
                        DateFormat formater = new SimpleDateFormat("yyyy/MM/dd");
                        cellValue = formater.format(date);
                    } else {
                        // 有些数字过大，直接输出使用的是科学计数法： 2.67458622E8 要进行处理
                        DecimalFormat df = new DecimalFormat("####.####");
                        cellValue = df.format(cell.getNumericCellValue());
                        // cellValue = cell.getNumericCellValue() + "";
                    }

            }
            else if(CellType.STRING.equals(cell.getCellType())){
                cellValue = cell.getStringCellValue();
            }
            else if(CellType.BOOLEAN.equals(cell.getCellType())){
                cellValue = cell.getBooleanCellValue() + "";
            }
            else if(CellType.FORMULA.equals(cell.getCellType())){
                try {
                    // 如果公式结果为字符串
                    cellValue = String.valueOf(cell.getStringCellValue());
                } catch (IllegalStateException e) {
                    if (HSSFDateUtil.isCellDateFormatted(cell)) {// 判断是否为日期类型
                        Date date = cell.getDateCellValue();
                        //                      DateFormat formater = new SimpleDateFormat("yyyy/MM/dd HH:mm");
                        DateFormat formater = new SimpleDateFormat("yyyy/MM/dd");
                        cellValue = formater.format(date);
                    } else {
                        FormulaEvaluator evaluator = cell.getSheet().getWorkbook().getCreationHelper()
                                .createFormulaEvaluator();
                        evaluator.evaluateFormulaCell(cell);
                        // 有些数字过大，直接输出使用的是科学计数法： 2.67458622E8 要进行处理
                        DecimalFormat df = new DecimalFormat("####.####");
                        cellValue = df.format(cell.getNumericCellValue());
                        //                          cellValue = cell.getNumericCellValue() + "";
                    }
                }
            }
            else if(CellType.BLANK.equals(cell.getCellType())){
                cellValue = "";
            }
            else if(CellType.ERROR.equals(cell.getCellType())){
                cellValue = "非法字符";
            }
            else { // "未知类型";
                cellValue = "未知类型";
            }

        }
        return cellValue;
    }




}

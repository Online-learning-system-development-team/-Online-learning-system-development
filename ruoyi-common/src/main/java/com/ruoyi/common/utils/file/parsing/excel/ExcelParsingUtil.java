package com.ruoyi.common.utils.file.parsing.excel;

import com.ruoyi.common.interfaces.Function2;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.Sheet;

import java.util.List;
import java.util.function.Consumer;

/**
 * @description:
 */
public interface ExcelParsingUtil<T> {

    List<T> getSheetByIndex(Class<T> cla,Sheet sheet, Function2<String,Integer,T> fun, Consumer<T> con, int titleLength) throws Exception;
    List<T> getSheetByIndex(Class<T> cla,Sheet sheet, Function2<String,Integer,T> fun, int titleLength) throws Exception;

    List<T> getSheetByIndex(Class<T> cla,Sheet sheet, Function2<String,Integer,T> fun,Consumer<T> con) throws Exception;
    List<T> getSheetByIndex(Class<T> cla,Sheet sheet, Function2<String,Integer,T> fun ) throws Exception;
}

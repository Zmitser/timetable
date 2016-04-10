package by.zmitserkoskinen.webapp.utils.excel;


import by.zmitserkoskinen.webapp.models.Progress;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public class ProgressExcelBuilder extends AbstractExcelView {
    @Override
    protected void buildExcelDocument(Map<String, Object> map,
                                      HSSFWorkbook hssfWorkbook,
                                      HttpServletRequest httpServletRequest,
                                      HttpServletResponse httpServletResponse) throws Exception {



        List<Progress> progressList = (List<Progress>) map.get("progresses");
        HSSFSheet sheet = hssfWorkbook.createSheet("progresses");
        sheet.setDefaultColumnWidth(60);


        CellStyle style = hssfWorkbook.createCellStyle();
        Font font = hssfWorkbook.createFont();
        font.setFontName("Arial");
        style.setFillForegroundColor(HSSFColor.DARK_BLUE.index);
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setColor(HSSFColor.RED.index);
        style.setFont(font);


        HSSFRow header = sheet.createRow(0);

        header.createCell(0).setCellValue("Student");
        header.getCell(0).setCellStyle(style);

        header.createCell(1).setCellValue("Subject");
        header.getCell(1).setCellStyle(style);

        header.createCell(2).setCellValue("Score");
        header.getCell(2).setCellStyle(style);

        header.createCell(3).setCellValue("Date");
        header.getCell(3).setCellStyle(style);

        // create data rows
        int rowCount = 1;

        for (Progress progress : progressList) {
            HSSFRow aRow = sheet.createRow(rowCount++);
            aRow.createCell(0).setCellValue(progress.getStudent().getName());
            aRow.createCell(1).setCellValue(progress.getSubject().getName());
            aRow.createCell(2).setCellValue(progress.getScore());
            aRow.createCell(3).setCellValue(progress.getDate().toString());
        }

    }
}

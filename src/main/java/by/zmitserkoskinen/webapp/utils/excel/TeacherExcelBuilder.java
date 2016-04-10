package by.zmitserkoskinen.webapp.utils.excel;

import by.zmitserkoskinen.webapp.models.Teacher;
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

/**
 * Created by Dimka on 02.04.2016.
 */
public class TeacherExcelBuilder extends AbstractExcelView {
    @Override
    protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook hssfWorkbook, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        List<Teacher> teachers = (List<Teacher>) map.get("teachers");
        HSSFSheet sheet = hssfWorkbook.createSheet("Teachers");
        sheet.setDefaultColumnWidth(30);
        CellStyle style = hssfWorkbook.createCellStyle();
        Font font = hssfWorkbook.createFont();
        font.setFontName("Arial");
        style.setFillForegroundColor(HSSFColor.AQUA.index);
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setColor(HSSFColor.RED.index);
        style.setFont(font);

        HSSFRow header = sheet.createRow(0);

        header.createCell(0).setCellValue("Teacher Name");
        header.getCell(0).setCellStyle(style);

        header.createCell(1).setCellValue("Subjects");
        header.getCell(1).setCellStyle(style);

        header.createCell(2).setCellValue("Email");
        header.getCell(2).setCellStyle(style);

        header.createCell(3).setCellValue("Skype");
        header.getCell(3).setCellStyle(style);

        header.createCell(4).setCellValue("Phone");
        header.getCell(4).setCellStyle(style);

        header.createCell(5).setCellValue("Description");
        header.getCell(5).setCellStyle(style);

        int rowCount = 1;
        for (Teacher teacher : teachers) {
            HSSFRow aRow = sheet.createRow(rowCount++);
            aRow.createCell(0).setCellValue(teacher.getName());
            aRow.createCell(1).setCellValue(teacher.getSubjects().toString());
            aRow.createCell(2).setCellValue(teacher.getEmail());
            aRow.createCell(3).setCellValue(teacher.getSkype());
            aRow.createCell(4).setCellValue(teacher.getPhone());
            aRow.createCell(5).setCellValue(teacher.getDescr());
        }
    }
}

package by.zmitserkoskinen.webapp.utils.pdf;


import by.zmitserkoskinen.webapp.models.Student;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public class StudentPdfBuilder extends AbstractITextPdfView {
    public static final String FONT = "fonts/Times New Roman Cyr Regular.ttf";
    @Override
    protected void buildPdfDocument(Map<String, Object> map, Document document, PdfWriter pdfWriter, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        List<Student> students = (List<Student>) map.get("students");
        document.add(new Paragraph("Students"));
        PdfPTable table = new PdfPTable(6);
        table.setWidths(new float[] {3.0f, 2.0f, 2.0f, 2.0f, 3.0f, 4.0f});
        table.setSpacingBefore(10);
        BaseFont bf = BaseFont.createFont(FONT, BaseFont.IDENTITY_H, BaseFont.EMBEDDED); //подключаем файл шрифта, который поддерживает кириллицу
        Font font = new Font(bf);
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(BaseColor.ORANGE);
        cell.setPadding(5);
        cell.setPhrase(new Phrase("Student Name", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Group", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Email", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Skype", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Phone", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Description", font));
        table.addCell(cell);
        cell.setBackgroundColor(BaseColor.WHITE);
        for (Student student : students) {
            cell.setPhrase(new Phrase(student.getName(), font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(student.getStudentGroup().getName(), font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(student.getEmail(), font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(student.getSkype(), font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(student.getPhone(), font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(student.getDescr(), font));
            table.addCell(cell);
        }
        document.add(table);

    }


}

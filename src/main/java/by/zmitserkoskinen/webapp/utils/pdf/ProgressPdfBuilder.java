package by.zmitserkoskinen.webapp.utils.pdf;

import by.zmitserkoskinen.webapp.models.Progress;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by Dimka on 02.04.2016.
 */
public class ProgressPdfBuilder extends AbstractITextPdfView {
    public static final String FONT = "fonts/Times New Roman Cyr Regular.ttf";
    @Override
    protected void buildPdfDocument(Map<String, Object> map, Document document, PdfWriter pdfWriter, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        List<Progress> progresses = (List<Progress>) map.get("progresses");
        document.add(new Paragraph("Progresses"));
        PdfPTable table = new PdfPTable(4);
        table.setWidths(new float[] {4.0f, 2.0f, 2.0f, 3.0f});
        table.setSpacingBefore(10);
        BaseFont bf = BaseFont.createFont(FONT, BaseFont.IDENTITY_H, BaseFont.EMBEDDED); //подключаем файл шрифта, который поддерживает кириллицу
        Font font = new Font(bf);
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(BaseColor.CYAN);
        cell.setPadding(5);
        cell.setPhrase(new Phrase("Student", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Subject", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Score", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Date", font));
        table.addCell(cell);
        cell.setBackgroundColor(BaseColor.WHITE);
        for (Progress progress : progresses) {
            cell.setPhrase(new Phrase(progress.getStudent().getName(), font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(progress.getSubject().getName(), font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(progress.getScore().toString(), font));
            table.addCell(cell);
            cell.setPhrase(new Phrase(progress.getDate().toString(), font));
            table.addCell(cell);
        }
        document.add(table);

    }


}

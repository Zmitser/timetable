package by.zmitserkoskinen.webapp.web.user;

import by.zmitserkoskinen.webapp.models.Student;
import by.zmitserkoskinen.webapp.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/ajax/user/students")
public class StudentAjaxController {

    @Autowired
    protected StudentService service;

    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Student> getAll() {
        return service.getAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public Student get(@PathVariable("id") int id) {
        return service.get(id);
    }

    @RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
    public ModelAndView downloadExcel() {
        List<Student> students = service.getAll();
        return new ModelAndView("studentExcelView", "students", students);
    }


    @RequestMapping(value = "/downloadPdf", method = RequestMethod.GET)
    public ModelAndView downloadPdf() {
        List<Student> students = service.getAll();
        return new ModelAndView("studentPdfView", "students", students);
    }

}

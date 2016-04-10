package by.zmitserkoskinen.webapp.web.user;


import by.zmitserkoskinen.webapp.models.Teacher;
import by.zmitserkoskinen.webapp.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/ajax/user/teachers")
public class TeacherAjaxController {
    @Autowired
    protected TeacherService service;

    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Teacher> getAll(){
        return service.getAll();
    }
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public Teacher get(@PathVariable("id") int id) {
        return service.get(id);
    }


    @RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
    public ModelAndView downloadExcel() {
        List<Teacher> teachers = service.getAllWithSubjects();
        return new ModelAndView("teacherExcelView", "teachers", teachers);
    }


    @RequestMapping(value = "/downloadPdf", method = RequestMethod.GET)
    public ModelAndView downloadPdf() {
        List<Teacher> teachers = service.getAllWithSubjects();
        return new ModelAndView("teacherPdfView", "teachers", teachers);
    }

}

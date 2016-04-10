package by.zmitserkoskinen.webapp.web.user;

import by.zmitserkoskinen.webapp.models.Progress;
import by.zmitserkoskinen.webapp.service.ProgressService;
import by.zmitserkoskinen.webapp.service.StudentService;
import by.zmitserkoskinen.webapp.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/ajax/user/progress")
public class ProgressAjaxController {
    @Autowired
    private ProgressService service;

    @Autowired
    private StudentService studentService;

   @Autowired
   private SubjectService subjectService;


    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Progress> getAll() {
        return service.getAll();
    }


    @RequestMapping(value = "/student/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Progress> getByStudentID(@PathVariable("id") int id) {
        return service.getAllByStudentId(id);
    }

    @RequestMapping(value = "/student",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Progress> getByStudentIdAndSubjectId(@RequestParam("student") int student, @RequestParam("subject") int subject) {
        return service.getByStudentIdAndSubjectId(student, subject);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public Progress get(@PathVariable("id") int id) {
        return service.get(id);
    }


    @RequestMapping(method = RequestMethod.POST)
    public void updateOrCreate(@Valid Progress progress,
                               @RequestParam("studentId") int studentId,
                               @RequestParam("subjectId") int subjectId,
                               BindingResult result,
                               SessionStatus status) {
        status.setComplete();
        progress.setSubject(subjectService.get(subjectId));
        progress.setStudent(studentService.get(studentId));

        if (progress.getId() == 0) {
            service.save(progress);
        } else {
            service.update(progress);
        }

    }

    @RequestMapping(value = "/downloadExcel", method = RequestMethod.GET)
    public ModelAndView downloadExcel() {
        List<Progress> progresses = service.getAll();
        return new ModelAndView("progressExcelView", "progresses", progresses);
    }


    @RequestMapping(value = "/downloadPdf", method = RequestMethod.GET)
    public ModelAndView downloadPdf() {
        List<Progress> progresses = service.getAll();
        return new ModelAndView("progressPdfView", "progresses", progresses);
    }

}

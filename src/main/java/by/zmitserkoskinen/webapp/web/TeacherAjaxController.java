package by.zmitserkoskinen.webapp.web;


import by.zmitserkoskinen.webapp.models.Teacher;
import by.zmitserkoskinen.webapp.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/ajax/teachers")
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

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") int id) {
        service.delete(id);
    }

    @RequestMapping(method = RequestMethod.POST)
    public void updateOrCreate(@Valid Teacher teacher, BindingResult result, SessionStatus status) {
        status.setComplete();
        if (teacher.getId() == 0) {
            service.save(teacher);
        } else {
            service.update(teacher);
        }


    }
}

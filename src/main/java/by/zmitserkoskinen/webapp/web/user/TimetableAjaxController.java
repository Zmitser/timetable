package by.zmitserkoskinen.webapp.web.user;

import by.zmitserkoskinen.webapp.models.Timetable;
import by.zmitserkoskinen.webapp.service.StudentGroupService;
import by.zmitserkoskinen.webapp.service.SubjectService;
import by.zmitserkoskinen.webapp.service.TimetableService;
import by.zmitserkoskinen.webapp.to.TimetableTO;
import by.zmitserkoskinen.webapp.utils.TimetableUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/ajax/user/timetable")
public class TimetableAjaxController {

    @Autowired
    protected TimetableService service;

    @Autowired
    protected SubjectService subjectService;

    @Autowired
    protected  StudentGroupService studentGroupService;

    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<TimetableTO> getAllTO(){
        List<Timetable> timetables = service.getAll();
        List<TimetableTO> timetablesTO = new ArrayList<>();
        for (Timetable timetable : timetables) {
            TimetableTO timetableTO = TimetableUtil.asTO(timetable);
            timetablesTO.add(timetableTO);
        }
        return timetablesTO;
    }

    @RequestMapping(value = "/timetableTo/{name}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<TimetableTO> getAllTOByGroup(@PathVariable("name") String name){
        List<Timetable> timetables = service.getAllByGroup(name);
        List<TimetableTO> timetablesTO = new ArrayList<>();
        for (Timetable timetable : timetables) {
            TimetableTO timetableTO = TimetableUtil.asTO(timetable);
            timetablesTO.add(timetableTO);
        }
        return timetablesTO;
    }


    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public Timetable get(@PathVariable("id") int id) {
        return service.get(id);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") int id) {
        service.delete(id);
    }

    @RequestMapping(method = RequestMethod.POST)
    public void updateOrCreate(@Valid Timetable timetable,
                               @RequestParam("studentGroupId") int studentGroupId,
                               @RequestParam("subjectId") int subjectId,
                               BindingResult result,
                               SessionStatus status) {
        status.setComplete();
        timetable.setGroup(studentGroupService.get(studentGroupId));
        timetable.setSubject(subjectService.get(subjectId));
        if (timetable.getId() == 0) {
            service.save(timetable);
        } else {
            service.update(timetable);
        }
    }
}

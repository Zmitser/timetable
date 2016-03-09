package by.zmitserkoskinen.webapp.web;

import by.zmitserkoskinen.webapp.models.Timetable;
import by.zmitserkoskinen.webapp.service.TimetableService;
import by.zmitserkoskinen.webapp.to.TimetableTO;
import by.zmitserkoskinen.webapp.utils.TimetableUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/ajax/timetable")
public class TimetableAjaxController {

    @Autowired
    protected TimetableService service;

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


    @RequestMapping(value = "/{name}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<TimetableTO> getAllTOByGroup(@PathVariable("name") String name){
        List<Timetable> timetables = service.getAllByGroup(name);
        List<TimetableTO> timetablesTO = new ArrayList<>();
        for (Timetable timetable : timetables) {
            TimetableTO timetableTO = TimetableUtil.asTO(timetable);
            timetablesTO.add(timetableTO);
        }
        return timetablesTO;
    }
}

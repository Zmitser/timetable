package by.zmitserkoskinen.webapp.web.user;

import by.zmitserkoskinen.webapp.models.StudentGroup;
import by.zmitserkoskinen.webapp.service.StudentGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/ajax/user/group")
public class StudentGroupAjaxController {

    @Autowired
    private StudentGroupService service;

    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<StudentGroup> getAll() {
        return service.getAll();
    }
}

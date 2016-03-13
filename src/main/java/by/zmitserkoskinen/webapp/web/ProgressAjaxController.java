package by.zmitserkoskinen.webapp.web;

import by.zmitserkoskinen.webapp.models.Progress;
import by.zmitserkoskinen.webapp.service.ProgressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/ajax/progress")
public class ProgressAjaxController {

    @Autowired
    private ProgressService service;

    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Progress> getAll() {
        return service.getAll();
    }
}

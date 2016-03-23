package by.zmitserkoskinen.webapp.web.admin;

import by.zmitserkoskinen.webapp.models.Progress;
import by.zmitserkoskinen.webapp.service.ProgressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;

import javax.validation.Valid;

@RestController
@RequestMapping("/ajax/admin/progress")
public class AdminProgressAjaxController {
    @Autowired
    protected ProgressService service;

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") int id) {
        service.delete(id);
    }

    @RequestMapping(method = RequestMethod.POST)
    public void updateOrCreate(@Valid Progress progress,
                               BindingResult result,
                               SessionStatus status) {
        status.setComplete();
        if (progress.getId() == 0) {
            service.save(progress);
        } else {
            service.update(progress);
        }
    }

}

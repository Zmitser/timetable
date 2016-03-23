package by.zmitserkoskinen.webapp.web.user;

import by.zmitserkoskinen.webapp.models.Role;
import by.zmitserkoskinen.webapp.models.User;
import by.zmitserkoskinen.webapp.service.UserService;
import by.zmitserkoskinen.webapp.utils.PasswordUtil;
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
@RequestMapping("/ajax/user/users")
public class UserAjaxController {

    @Autowired
    protected UserService service;

    @RequestMapping(method = RequestMethod.POST)
    public void updateOrCreate(@Valid User user,
                               BindingResult result,
                               SessionStatus status) {
        status.setComplete();
        user.setPassword(PasswordUtil.encode(user.getPassword()));
        user.setRole(Role.ROLE_USER);
        if (user.getId() == 0) {
            service.save(user);
        } else {
            service.update(user);
        }
    }

    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<User> getAll(){
        return service.getAll();
    }
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public User get(@PathVariable("id") int id) {
        return service.get(id);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") int id) {
        service.delete(id);
    }
}

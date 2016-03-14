package by.zmitserkoskinen.webapp.web;

import by.zmitserkoskinen.webapp.models.User;
import by.zmitserkoskinen.webapp.service.UserService;
import by.zmitserkoskinen.webapp.utils.PasswordUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;

import javax.validation.Valid;

@RestController
@RequestMapping("/ajax/users")
public class UserAjaxController {

    @Autowired
    protected UserService service;

    @RequestMapping(method = RequestMethod.POST)
    public void updateOrCreate(@Valid User user,
                               BindingResult result,
                               SessionStatus status) {
        status.setComplete();
        user.setPassword(PasswordUtil.encode(user.getPassword()));
        if (user.getId() == 0) {
            service.save(user);
        } else {
            service.update(user);
        }

    }
}

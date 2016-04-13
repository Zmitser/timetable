package by.zmitserkoskinen.webapp.web.admin;

import by.zmitserkoskinen.webapp.models.Role;
import by.zmitserkoskinen.webapp.models.User;
import by.zmitserkoskinen.webapp.service.UserService;
import by.zmitserkoskinen.webapp.utils.PasswordUtil;
import by.zmitserkoskinen.webapp.utils.exceptions.ValidationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
@RequestMapping("/ajax/admin/users")
public class AdminUserAjaxController {

    @Autowired
    protected UserService service;

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") int id) {
        service.delete(id);
    }


    @RequestMapping(method = RequestMethod.POST)
    public void updateOrCreate(@Valid User user,
                               BindingResult result,
                               SessionStatus status,
                               HttpServletRequest request) {
        if (result.hasErrors()) {
            throw new ValidationException(result);
        }
        status.setComplete();
        user.setPassword(PasswordUtil.encode(user.getPassword()));
        user.setRole(Role.ROLE_USER);
        try {
            if (user.getId() == 0) {
                service.save(user);
            } else {
                service.update(user);
            }
        } catch (DataIntegrityViolationException e) {
            throw new DataIntegrityViolationException("User with this email already present in application");
        }

    }
}

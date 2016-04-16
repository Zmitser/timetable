package by.zmitserkoskinen.webapp.web.user;

import by.zmitserkoskinen.webapp.models.Role;
import by.zmitserkoskinen.webapp.models.User;
import by.zmitserkoskinen.webapp.service.UserService;
import by.zmitserkoskinen.webapp.utils.EmailSender;
import by.zmitserkoskinen.webapp.utils.PasswordUtil;
import by.zmitserkoskinen.webapp.utils.exceptions.ValidationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public User get(@PathVariable("id") int id) {
        return service.get(id);
    }

    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<User> getAll() {
        return service.getAll();
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ResponseEntity<String> get(HttpServletRequest request,
                                      @RequestParam(value = "error", required = false) boolean error) {

        if (error) {
            HttpSession session = request.getSession();
            Exception exception = (Exception) session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
            String message = exception.getMessage();
            return new ResponseEntity<>(message, HttpStatus.UNAUTHORIZED);
        }
        return new ResponseEntity<>(HttpStatus.ACCEPTED);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") int id) {
        service.delete(id);
    }


    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
    public void doSendEmail(HttpServletRequest request) {
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        EmailSender sender = EmailSender.getInstance();
        sender.sendEmail(subject, message);
    }
}
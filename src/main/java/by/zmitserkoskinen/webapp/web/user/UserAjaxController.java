package by.zmitserkoskinen.webapp.web.user;

import by.zmitserkoskinen.webapp.models.User;
import by.zmitserkoskinen.webapp.service.UserService;
import by.zmitserkoskinen.webapp.utils.EmailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
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
    public void saveRegister(@Valid User user,
                             BindingResult result,
                             SessionStatus status){
        if (!result.hasErrors()) {
            try {
                service.save(user);
                status.setComplete();
            } catch (DataIntegrityViolationException ex) {
                result.rejectValue("email", "error.user", "user with this email already present in application");
            }
        }
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




    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
    public void doSendEmail(HttpServletRequest request) {
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        EmailSender sender = EmailSender.getInstance();
        sender.sendEmail(subject, message);
    }
}

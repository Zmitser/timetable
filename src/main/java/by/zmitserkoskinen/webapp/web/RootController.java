package by.zmitserkoskinen.webapp.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RootController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getRoot(){
        return "redirect:index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String getIndex(){
        return "index";
    }

    @RequestMapping(value = "/students", method = RequestMethod.GET)
    public String getStudents(){
        return "students";
    }

    @RequestMapping(value = "/teachers", method = RequestMethod.GET)
    public String getTeachers(){
        return "teachers";
    }

    @RequestMapping(value = "/student/{id}", method = RequestMethod.GET)
    public String getStudentInformation(@PathVariable int id){
        return "studentCard";
    }

    @RequestMapping(value = "/teacher/{id}", method = RequestMethod.GET)
    public String getTeacherInformation(@PathVariable int id){
        return "teacherCard";
    }

    @RequestMapping(value = "/timetable", method = RequestMethod.GET)
    public String getTimetable(){
        return "timetable";
    }
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLoginPage(){
        return "login";
    }

    @RequestMapping(value = "/progress", method = RequestMethod.GET)
    public String getProgressPage(){
        return "progress";
    }

    @RequestMapping(value = "/success", method = RequestMethod.GET)
    public String getSuccessPage(){
        return "success";
    }
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String getUsersPage(){
        return "users";
    }
    @RequestMapping(value = "/email", method = RequestMethod.GET)
    public String getMailPage(){
        return "email";
    }

    @RequestMapping(value = "/socket", method = RequestMethod.GET)
    public String getSocketPage(){
        return "socket";
    }
}

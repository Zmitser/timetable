package by.zmitserkoskinen.webapp.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RootController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getRoot(){
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

    @RequestMapping(value = "timetable", method = RequestMethod.GET)
    public String getTimetable(){
        return "timetable";
    }
}

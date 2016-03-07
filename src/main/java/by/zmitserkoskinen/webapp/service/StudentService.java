package by.zmitserkoskinen.webapp.service;

import by.zmitserkoskinen.webapp.models.Student;

import java.util.List;

/**
 * Created by Dimka on 07.03.2016.
 */
public interface StudentService {


     Student save(Student student);


     void delete(int id);


     Student get(int id);


     void update(Student student);


     List<Student> getAll();
}

package by.zmitserkoskinen.webapp.service;

import by.zmitserkoskinen.webapp.models.Student;

import java.util.List;


public interface StudentService {


     Student save(Student student);


     void delete(int id);


     Student get(int id);


     void update(Student student);


     List<Student> getAll();

     Student getByName(String name);
}

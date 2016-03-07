package by.zmitserkoskinen.webapp.service;

import by.zmitserkoskinen.webapp.models.Student;
import by.zmitserkoskinen.webapp.repository.StudentGroupRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Dimka on 07.03.2016.
 */
public class StudentGroupServiceImpl implements StudentService {

    @Autowired
    StudentGroupRepository repository;

    @Override
    public Student save(Student student) {
        return null;
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public Student get(int id) {
        return null;
    }

    @Override
    public void update(Student student) {

    }

    @Override
    public List<Student> getAll() {
        return null;
    }
}

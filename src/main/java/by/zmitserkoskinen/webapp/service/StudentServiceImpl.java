package by.zmitserkoskinen.webapp.service;


import by.zmitserkoskinen.webapp.models.Student;
import by.zmitserkoskinen.webapp.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRepository repository;

    @Override
    public Student save(Student student) {
        return repository.save(student);
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }

    @Override
    public Student get(int id) {
        return repository.findOne(id);
    }

    @Override
    public void update(Student student) {
        repository.save(student);
    }

    @Override
    public List<Student> getAll() {
        return repository.findAll();
    }

    @Override
    public Student getByName(String name) {
        return repository.getOneByName(name);
    }


}

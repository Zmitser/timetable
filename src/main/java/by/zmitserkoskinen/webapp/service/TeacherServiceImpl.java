package by.zmitserkoskinen.webapp.service;


import by.zmitserkoskinen.webapp.models.Teacher;
import by.zmitserkoskinen.webapp.repository.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherRepository repository;

    @Override
    public Teacher save(Teacher teacher) {
        return repository.save(teacher);
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }

    @Override
    public Teacher get(int id) {
        return repository.findOne(id);
    }

    @Override
    public void update(Teacher teacher) {

        repository.save(teacher);
    }

    @Override
    public List<Teacher> getAll() {
        return repository.findAll();
    }
}

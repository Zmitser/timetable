package by.zmitserkoskinen.webapp.service;


import by.zmitserkoskinen.webapp.models.Subject;
import by.zmitserkoskinen.webapp.repository.SubjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectService{

    @Autowired
    SubjectRepository repository;

    @Override
    public Subject save(Subject subject) {
        return repository.save(subject);
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }

    @Override
    public Subject get(int id) {
        return repository.findOne(id);
    }

    @Override
    public void update(Subject subject) {
        repository.save(subject);
    }

    @Override
    public List<Subject> getAll() {
        return repository.findAll();
    }
}

package by.zmitserkoskinen.webapp.service;

import by.zmitserkoskinen.webapp.models.StudentGroup;
import by.zmitserkoskinen.webapp.repository.StudentGroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentGroupServiceImpl implements StundentGroupService {

    @Autowired
    private StudentGroupRepository repository;

    @Override
    public StudentGroup save(StudentGroup studentGroup) {
        return repository.save(studentGroup);
    }

    @Override
    public void delete(int id) {
            repository.delete(id);
    }

    @Override
    public StudentGroup get(int id) {
        return repository.getOne(id);
    }

    @Override
    public void update(StudentGroup student) {
        repository.save(student);
    }

    @Override
    public List<StudentGroup> getAll() {
        return repository.findAll();
    }
}

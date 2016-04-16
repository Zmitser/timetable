package by.zmitserkoskinen.webapp.service;


import by.zmitserkoskinen.webapp.models.Progress;
import by.zmitserkoskinen.webapp.repository.ProgressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProgressServiceImpl implements ProgressService {

    @Autowired
    private ProgressRepository repository;

    @Override
    public Progress save(Progress progress) {
        return repository.save(progress);
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }

    @Override
    public Progress get(int id) {
        return repository.findOne(id);
    }

    @Override
    public void update(Progress progress) {
        repository.save(progress);
    }

    @Override
    public List<Progress> getAll() {
        return repository.findAll();
    }

    @Override
    public List<Progress> getAllByStudentId(int id) {
        return repository.findAllByStudentId(id);
    }

    @Override
    public List<Progress> getByStudentIdAndSubjectId(int studentId, int subjectId) {
        return repository.findAllByStudentIdAndSubjectIdOrderByDateAsc(studentId, subjectId);
    }


}

package by.zmitserkoskinen.webapp.service;

import by.zmitserkoskinen.webapp.models.Timetable;
import by.zmitserkoskinen.webapp.repository.TimetableRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TimetableServiceImpl implements TimetableService {

    @Autowired
    private TimetableRepository repository;

    @Override
    public Timetable save(Timetable timetable) {
        return repository.save(timetable);
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }

    @Override
    public Timetable get(int id) {
        return repository.findOne(id);
    }

    @Override
    public void update(Timetable timetable) {
        repository.save(timetable);
    }

    @Override
    public List<Timetable> getAll() {
        return repository.findAll();
    }

    @Override
    public List<Timetable> getAllByGroup(String groupName) {
        return repository.findAllByGroup_Name(groupName);
    }
}

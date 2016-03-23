package by.zmitserkoskinen.webapp.service;


import by.zmitserkoskinen.webapp.models.Subject;

import java.util.List;

public interface SubjectService {

    Subject save(Subject subject);

    void delete(int id);

    Subject get(int id);

    void update(Subject student);

    List<Subject> getAll();

}

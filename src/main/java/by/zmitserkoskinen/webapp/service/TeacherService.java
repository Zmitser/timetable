package by.zmitserkoskinen.webapp.service;


import by.zmitserkoskinen.webapp.models.Teacher;

import java.util.List;

public interface TeacherService {

    Teacher save(Teacher student);

    void delete(int id);

    Teacher get(int id);

    void update(Teacher student);

    List<Teacher> getAll();

    List<Teacher> getAllWithSubjects();

}

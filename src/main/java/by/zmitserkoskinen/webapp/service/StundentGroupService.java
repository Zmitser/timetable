package by.zmitserkoskinen.webapp.service;


import by.zmitserkoskinen.webapp.models.Student;
import by.zmitserkoskinen.webapp.models.StudentGroup;

import java.util.List;

public interface StundentGroupService {

    StudentGroup save(Student student);

    void delete(int id);

    StudentGroup get(int id);

    void update(StudentGroup studentGroup);

    List<StudentGroup> getAll();
}

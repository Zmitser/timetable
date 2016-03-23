package by.zmitserkoskinen.webapp.service;

import by.zmitserkoskinen.webapp.models.Progress;

import java.util.List;


public interface ProgressService {

    Progress save(Progress progress);

    void delete(int id);

    Progress get(int id);

    void update(Progress progress);

    List<Progress> getAll();

    List<Progress> getAllByStudentId(int id);

    List<Progress> getByStudentIdAndSubjectId(int studentId, int subjectId);
}

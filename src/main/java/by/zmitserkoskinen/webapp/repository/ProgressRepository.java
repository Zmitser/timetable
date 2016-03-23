package by.zmitserkoskinen.webapp.repository;


import by.zmitserkoskinen.webapp.models.Progress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface ProgressRepository  extends JpaRepository<Progress, Integer>{

    List<Progress> findAllByStudentId(int id);

    List<Progress> findAllByStudentIdAndSubjectId(int id, int subjectId);

}

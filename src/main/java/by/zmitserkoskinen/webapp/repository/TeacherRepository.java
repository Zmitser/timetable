package by.zmitserkoskinen.webapp.repository;


import by.zmitserkoskinen.webapp.models.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface TeacherRepository extends JpaRepository<Teacher, Integer> {

    @Query("SELECT t FROM Teacher t LEFT JOIN FETCH t.subjects")
    List<Teacher> findAllWithSubjects();
}

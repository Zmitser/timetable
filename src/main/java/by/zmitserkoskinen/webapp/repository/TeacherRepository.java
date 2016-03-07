package by.zmitserkoskinen.webapp.repository;


import by.zmitserkoskinen.webapp.models.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface TeacherRepository extends JpaRepository<Teacher, Integer> {

}

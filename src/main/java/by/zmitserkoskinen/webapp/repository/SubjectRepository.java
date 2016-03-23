package by.zmitserkoskinen.webapp.repository;

import by.zmitserkoskinen.webapp.models.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface SubjectRepository extends JpaRepository<Subject, Integer> {
}

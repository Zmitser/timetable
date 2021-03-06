package by.zmitserkoskinen.webapp.repository;

import by.zmitserkoskinen.webapp.models.StudentGroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface StudentGroupRepository extends JpaRepository<StudentGroup, Integer> {

}

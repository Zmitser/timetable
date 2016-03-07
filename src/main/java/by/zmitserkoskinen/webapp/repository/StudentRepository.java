package by.zmitserkoskinen.webapp.repository;

import by.zmitserkoskinen.webapp.models.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface StudentRepository extends JpaRepository<Student, Integer> {


    @Transactional
    @Modifying
    @Query("DELETE FROM Student s WHERE s.id=:id")
    void delete(@Param("id") int id);

    @Override
    @Transactional
    Student save(Student s);

    @Override
    Student findOne(Integer integer);

    @Override
    List<Student> findAll();

}

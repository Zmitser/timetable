package by.zmitserkoskinen.webapp.repository;

import by.zmitserkoskinen.webapp.models.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface StudentRepository extends JpaRepository<Student, Integer> {

    @Override
    @Transactional
    Student save(Student s);

    @Override
    Student findOne(Integer integer);

    @Override
    List<Student> findAll();

    Student getOneByName(String name);
}

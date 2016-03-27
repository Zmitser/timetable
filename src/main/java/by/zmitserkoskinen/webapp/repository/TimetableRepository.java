package by.zmitserkoskinen.webapp.repository;


import by.zmitserkoskinen.webapp.models.Timetable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TimetableRepository extends JpaRepository<Timetable, Integer>{

    List<Timetable> findAllByGroupName(String groupName);
}

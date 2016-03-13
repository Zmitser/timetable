package by.zmitserkoskinen.webapp.repository;


import by.zmitserkoskinen.webapp.models.Progress;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProgressRepository  extends JpaRepository<Progress, Integer>{
}

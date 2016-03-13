package by.zmitserkoskinen.webapp.repository;


import by.zmitserkoskinen.webapp.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {

    User getByEmail(String email);
}

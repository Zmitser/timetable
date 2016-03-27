package by.zmitserkoskinen.webapp.service;

import by.zmitserkoskinen.webapp.LoggedUser;
import by.zmitserkoskinen.webapp.models.User;
import by.zmitserkoskinen.webapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService, UserDetailsService{

    @Autowired
    UserRepository userRepository;


    @Override
    public User save(User user) {
        return userRepository.save(user);
    }

    @Override
    public void delete(int id) {
        userRepository.delete(id);
    }

    @Override
    public User get(int id) {
        return userRepository.findOne(id);
    }

    @Override
    public void update(User user) {
        userRepository.save(user);;
    }

    @Override
    public List<User> getAll() {
        return userRepository.findAll();
    }

    @Override
    public LoggedUser loadUserByUsername(String login) throws UsernameNotFoundException {
        User u = userRepository.getByEmail(login.toLowerCase());
        if (u == null) {
            throw new UsernameNotFoundException("User " + login + " is not found");
        }
        return new LoggedUser(u);
    }
}

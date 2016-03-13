package by.zmitserkoskinen.webapp.service;

import by.zmitserkoskinen.webapp.models.User;

import java.util.List;


public interface UserService {

    User save(User timetable);


    void delete(int id);


    User get(int id);


    void update(User user);


    List<User> getAll();


}

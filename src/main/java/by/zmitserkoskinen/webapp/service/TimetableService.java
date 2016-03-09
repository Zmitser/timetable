package by.zmitserkoskinen.webapp.service;


import by.zmitserkoskinen.webapp.models.Timetable;

import java.util.List;

public interface TimetableService {


    Timetable save(Timetable timetable);


    void delete(int id);


    Timetable get(int id);


    void update(Timetable timetable);


    List<Timetable> getAll();


    List<Timetable> getAllByGroup(String groupName);

}

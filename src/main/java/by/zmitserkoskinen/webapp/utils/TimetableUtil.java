package by.zmitserkoskinen.webapp.utils;

import by.zmitserkoskinen.webapp.models.Timetable;
import by.zmitserkoskinen.webapp.to.TimetableTO;


public class TimetableUtil {

    public static TimetableTO asTO(Timetable timetable) {
        return new TimetableTO(timetable.getId(), timetable.getSubject().getName() + "\n" + timetable.getGroup().getName(), timetable.getStartTime(), timetable.getEndTime());
    }
}

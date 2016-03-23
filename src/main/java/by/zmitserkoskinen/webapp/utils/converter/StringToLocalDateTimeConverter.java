package by.zmitserkoskinen.webapp.utils.converter;


import by.zmitserkoskinen.webapp.utils.TimeUtil;
import org.springframework.core.convert.converter.Converter;

import java.time.LocalDateTime;

public class StringToLocalDateTimeConverter implements Converter<String, LocalDateTime> {

    @Override
    public LocalDateTime convert(String param) {
        return TimeUtil.parseLocalDateTime(param);
    }
}

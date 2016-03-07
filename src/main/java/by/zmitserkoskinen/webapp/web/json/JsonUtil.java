package by.zmitserkoskinen.webapp.web.json;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectReader;

import java.io.IOException;
import java.util.List;

import static by.zmitserkoskinen.webapp.web.json.CustomObjectMapper.getMapper;


public class JsonUtil {


    public static <T> List<T> readValues(String json, Class<T> clazz) throws IOException {
        ObjectReader reader = getMapper().readerFor(clazz);
        return reader.<T>readValues(json).readAll();

    }

    public static <T> T readValue(String json, Class<T> clazz) throws IOException {
            return getMapper().readValue(json, clazz);

    }

    public static <T> String writeValue(T obj) {
        try {
            return getMapper().writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            throw new IllegalStateException("Invalid write to JSON:\n'" + obj + "'", e);
        }
    }
}

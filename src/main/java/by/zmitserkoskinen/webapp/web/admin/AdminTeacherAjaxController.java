package by.zmitserkoskinen.webapp.web.admin;

import by.zmitserkoskinen.webapp.models.Teacher;
import by.zmitserkoskinen.webapp.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.*;

@RestController
@RequestMapping("/ajax/admin/teachers")
public class AdminTeacherAjaxController {
    @Autowired
    protected TeacherService service;

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") int id) {
        service.delete(id);
    }
    @RequestMapping(method = RequestMethod.POST)
    public void updateOrCreate(@Valid Teacher teacher, BindingResult result, SessionStatus status) {
        status.setComplete();
        if (teacher.getId() == 0) {
            service.save(teacher);
        } else {
            service.update(teacher);
        }
    }
    @RequestMapping("/fileUpload")
    public ResponseEntity<String> fileUploaded(
            @RequestParam("file") MultipartFile uploadedFile, SessionStatus status) {
        status.setComplete();
        InputStream inputStream;
        OutputStream outputStream;
        String fileName = uploadedFile.getOriginalFilename();
        String fullFileName = "E:/projectForMe/timetable/src/main/webapp/resources/img/" + fileName;
        try {
            inputStream = uploadedFile.getInputStream();
            File newFile = new File(fullFileName);
            if (!newFile.exists()) {
                newFile.createNewFile();
            }
            outputStream = new FileOutputStream(newFile);
            int read;
            byte[] bytes = new byte[1024];

            while ((read = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
            inputStream.close();
            outputStream.close();
        } catch (IOException e) {
            return new ResponseEntity<>(fileName, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(fileName, HttpStatus.OK);
    }
}

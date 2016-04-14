package by.zmitserkoskinen.webapp.web.admin;

import by.zmitserkoskinen.webapp.models.Teacher;
import by.zmitserkoskinen.webapp.service.TeacherService;
import by.zmitserkoskinen.webapp.utils.exceptions.ImageUploadException;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;

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
            @RequestParam(value = "file", required = false) MultipartFile uploadedFile, SessionStatus status) {
        status.setComplete();
        String fileName = uploadedFile.getOriginalFilename();
        try {
            if (!uploadedFile.isEmpty()) {
                validateImage(uploadedFile);
                saveImage(uploadedFile);
            }
        } catch (ImageUploadException e) {
            return new ResponseEntity<>(fileName, HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(fileName, HttpStatus.OK);
    }

    private void saveImage(MultipartFile uploadedFile) throws ImageUploadException {
        try {
            File file = new File("src/main/webapp/resources/img/" + uploadedFile.getOriginalFilename());
            FileUtils.writeByteArrayToFile(file, uploadedFile.getBytes());
        } catch (IOException e){
            throw new ImageUploadException("Unable to save image", e);
        }

    }

    private void validateImage(MultipartFile uploadedFile) {
        if (!uploadedFile.getContentType().equals("image/jpeg") && uploadedFile.getContentType().equals("image/png")) {
            throw new ImageUploadException("Only images accepted");
        }
    }
}

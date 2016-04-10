package by.zmitserkoskinen.webapp.models;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "teacher")
public class Teacher extends BaseEntity implements Serializable {


    @Column(name = "name", nullable = false)
    @NotEmpty
    @Length(min = 3, max = 300, message = "The name must be at least 3 and 300 characters long!")
    protected String name;

    @Column(name = "photo", nullable = false)
    @NotEmpty
    protected String photo;

    @Column(name = "email", nullable = false)
    @NotEmpty
    @Email
    @Pattern(regexp = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", message = "Invalid Email Address!")

    protected String email;

    @Column(name = "phone", nullable = false)
    @NotEmpty
    protected String phone;

    @Column(name = "skype", nullable = false)
    @NotEmpty
    @Length(min = 3, max = 50, message = "The skype login  must be at least 3 and 300 characters long!")
    protected String skype;

    @Column(name = "descr", nullable = false)
    @NotEmpty
    @Length(max = 500, message = "The description must be less 500 characters !")
    protected String descr;

    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "teachers")
    protected List<Subject> subjects;

    public Teacher() {
    }

    public Teacher(Integer id, String email, String name, String phone, String photo, String skype) {
        super(id);
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.photo = photo;
        this.skype = skype;
    }

    public Teacher(Teacher teacher) {
        this(teacher.getId(), teacher.getEmail(), teacher.getName(), teacher.getPhone(), teacher.getPhoto(), teacher.getSkype());
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;;
    }

    public List<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<Subject> subjects) {
        this.subjects = subjects;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getSkype() {
        return skype;
    }

    public void setSkype(String skype) {
        this.skype = skype;
    }
}

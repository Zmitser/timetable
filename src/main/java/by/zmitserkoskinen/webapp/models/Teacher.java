package by.zmitserkoskinen.webapp.models;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "teacher")
public class Teacher extends BaseEntity implements Serializable {


    @Column(name = "name", nullable = false)
    @NotEmpty
    @Length(max = 100)
    protected String name;

    @Column(name = "photo", nullable = false)
    @NotEmpty
    protected String photo;

    @Column(name = "email", nullable = false)
    @NotEmpty
    @Email
    protected String email;

    @Column(name = "phone", nullable = false)
    @NotEmpty
    protected String phone;

    @Column(name = "skype", nullable = false)
    @NotEmpty
    protected String skype;

    @Column(name = "descr", nullable = false)
    @NotEmpty
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

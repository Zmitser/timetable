package by.zmitserkoskinen.webapp.models;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import java.io.Serializable;

@Entity
@Table(name = "teacher", uniqueConstraints = {@UniqueConstraint(columnNames = "email", name = "email_UNIQUE"),
        @UniqueConstraint(columnNames = "skype", name = "skype_UNIQUE"), @UniqueConstraint(columnNames = "phone",
        name = "phone_UNIQUE")})
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

    public Teacher setEmail(String email) {
        this.email = email;
        return this;
    }

    public String getName() {
        return name;
    }

    public Teacher setName(String name) {
        this.name = name;
        return this;
    }

    public String getPhone() {
        return phone;
    }

    public Teacher setPhone(String phone) {
        this.phone = phone;
        return this;
    }

    public String getPhoto() {
        return photo;
    }

    public Teacher setPhoto(String photo) {
        this.photo = photo;
        return this;
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

    public Teacher setSkype(String skype) {
        this.skype = skype;
        return this;
    }
}

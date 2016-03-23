package by.zmitserkoskinen.webapp.models;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "student")
public class Student extends BaseEntity implements Serializable {
    @Column(name = "name", nullable = false)
    @Length(max = 300)
    protected String name;

    @Column(name = "photo")
    protected String photo;

    @Email
    @NotEmpty
    @Column(name = "email", nullable = false, unique = true)
    protected String email;

    @NotEmpty
    @Column(name = "skype", nullable = false, unique = true)
    protected String skype;

    @NotEmpty
    @Column(name = "descr", nullable = false)
    protected String descr;

    @NotEmpty
    @Column(name = "phone", nullable = false)
    protected String phone;

    @ManyToOne(cascade = CascadeType.REMOVE, fetch = FetchType.EAGER)
    @JoinColumn(name = "group_id")
    protected StudentGroup studentGroup;

    public Student() {
    }

    public Student(Integer id, String descr, String email, StudentGroup studentGroup, String name, String photo, String skype) {
        super(id);
        this.descr = descr;
        this.email = email;
        this.studentGroup = studentGroup;
        this.name = name;
        this.photo = photo;
        this.skype = skype;
    }


    public Student(Student student) {
        this(student.getId(), student.getDescr(), student.getEmail(), student.getStudentGroup(), student.getName(), student.getPhoto(), student.getSkype());
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSkype() {
        return skype;
    }

    public void setSkype(String skype) {
        this.skype = skype;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public StudentGroup getStudentGroup() {
        return studentGroup;
    }

    public void setStudentGroup(StudentGroup studentGroup) {
        this.studentGroup = studentGroup;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}

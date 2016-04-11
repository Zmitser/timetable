package by.zmitserkoskinen.webapp.models;


import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "subjects")
public class Subject extends BaseEntity implements Serializable{

    @Column(name = "name")
    @Length(min = 3, max = 100, message = "The name must be at least 3 and 100 characters long!")
    protected String name;


    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    @JoinTable(name = "teacher_subject", joinColumns = {@JoinColumn(name = "subject_id", nullable = false, updatable = false)},
    inverseJoinColumns = {@JoinColumn(name = "teacher_id", nullable = false, updatable = false)})
    protected List<Teacher> teachers;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Teacher> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<Teacher> teachers) {
        this.teachers = teachers;
    }

    public Subject() {
    }

    public Subject(String name) {
        this.name = name;
    }

    public Subject(Integer id, String name) {
        super(id);
        this.name = name;
    }
}

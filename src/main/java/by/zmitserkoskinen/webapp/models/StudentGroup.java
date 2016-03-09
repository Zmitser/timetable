package by.zmitserkoskinen.webapp.models;


import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "student_group")
public class StudentGroup extends BaseEntity implements Serializable{

    @Column(name = "name")
    @Length(max = 100)
    protected String name;

    @OneToMany(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY, mappedBy = "studentGroup")
    protected List<Student> students;

    public StudentGroup() {
    }

    public StudentGroup(String name) {
        this.name = name;
    }

    public StudentGroup(Integer id, String name) {
        super(id);
        this.name = name;
    }

    public StudentGroup(Integer id, String name, List<Student> students) {
        super(id);
        this.name = name;
        this.students = students;
    }

    public String getName() {
        return name;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }
}

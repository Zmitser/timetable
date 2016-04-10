package by.zmitserkoskinen.webapp.models;


import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Table(name = "progress")
public class Progress extends BaseEntity implements Serializable{

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "student_id")
    protected Student student;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "subject_id")
    protected Subject subject;

    @Column(name = "score")
    protected Integer score;

    @Column(name = "date")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    protected LocalDate date;


    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }


    public Progress() {
    }

    public Progress(LocalDate date, Integer score, Student student, Subject subject) {
        this.date = date;
        this.score = score;
        this.student = student;
        this.subject = subject;
    }

    public Progress(Integer id, LocalDate date, Integer score, Student student, Subject subject) {
        super(id);
        this.date = date;
        this.score = score;
        this.student = student;
        this.subject = subject;
    }


}

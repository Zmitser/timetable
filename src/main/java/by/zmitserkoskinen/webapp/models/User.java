package by.zmitserkoskinen.webapp.models;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "users")
public class User  extends BaseEntity{

    @Column(name = "email", nullable = false, unique = true)
    @Email
    @NotEmpty
    @Pattern(regexp = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", message = "Invalid Email Address!")
    protected String email;

    @Column(name = "password", nullable = false)
    @NotEmpty
    @Length(min = 3, max = 60)
    protected String password;

    @Column(name = "role")
    @Enumerated(EnumType.STRING)
    protected Role role;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public User() {
    }

    public User(Integer id, String email, String password) {
        super(id);
        this.email = email;
        this.password = password;

    }

    public User(Integer id, String email, String password, Role role) {
        super(id);
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public User(String email, String password, Role role) {
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;

    }


}

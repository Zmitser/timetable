package by.zmitserkoskinen.webapp;

import by.zmitserkoskinen.webapp.models.Role;
import by.zmitserkoskinen.webapp.models.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;

import static java.util.Objects.requireNonNull;
public class LoggedUser implements UserDetails, Serializable {

    private String email;
    private String password;
    private Role role;


    public LoggedUser(User user) {
        this.email = user.getEmail();
        this.password = user.getPassword();
        this.role = user.getRole();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.singleton(role);
    }

    public static LoggedUser unSafeGet() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null) {
            return null;
        }
        Object acc = auth.getPrincipal();
        return (acc instanceof LoggedUser) ?
                (LoggedUser) acc : null;
    }

    public static LoggedUser get() {
        LoggedUser acc = unSafeGet();
        requireNonNull(acc, "No authorized account found");
        return acc;
    }
    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return email;
    }



    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}

package com.mitrais.rms.service;

import com.mitrais.rms.entity.User;
import com.mitrais.rms.user.CrmUser;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    User findByUserName(String userName);
    
    List<User> findAll();

    void save(CrmUser crmUser);
    
    void update(User user);
    
    void delete(String userName);
}

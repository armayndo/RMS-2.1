package com.mitrais.rms.dao;

import java.util.List;

import com.mitrais.rms.entity.User;

public interface UserDao {

    User findByUserName(String userName);
    
    List<User> findAll();
    
    void save(User user);
    
    void delete(String userName);
    
}

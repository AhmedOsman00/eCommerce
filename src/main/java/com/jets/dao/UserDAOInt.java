package com.jets.dao;

import com.jets.dao.User;

/**
 *
 * @author Fadwa
 */
public interface UserDAOInt {
    public User selectUser (String email);
    public boolean insertUser (User user);
    public boolean deleteUser (String email);
    public boolean updateUser (User user);
}

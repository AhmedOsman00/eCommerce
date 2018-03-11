package com.jets.dao;

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

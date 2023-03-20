
package services;

import dataaccess.RoleDB;
import dataaccess.UserDB;
import java.util.List;
import models.Role;
import models.User;

/**
 *
 * @author Majid
 */
public class UserService {

    public User get(String email) throws Exception {
        //constructs userDB and get me that user based on email
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        return user;
    }

    public List<User> getAll() throws Exception {
        //get all users
        UserDB userDB = new UserDB();
        List<User> users = userDB.getAll();
        return users;
    }

    public void insert(String email, String first_name, String last_name, String password, int role) throws Exception {
       User newUser = new User(email, first_name, last_name, password);
        RoleDB roleDB = new RoleDB();
        Role roleName = roleDB.get(role);
        newUser.setRole(roleName);
        UserDB newUserDB = new UserDB();
        newUserDB.insert(newUser);
    }

    public void update(String email, String first_name, String last_name, String password, int role) throws Exception {
        User updateUser = new User(email, first_name, last_name, password);
        RoleDB roleDB = new RoleDB();
        Role roleName = roleDB.get(role);
        updateUser.setRole(roleName);
        UserDB updateUserDB = new UserDB();
        updateUserDB.update(updateUser);
    }

    public void delete(String email) throws Exception {
        UserDB deleteUserDB = new UserDB();
        deleteUserDB.delete(email);
    }
    }


package Login;

import Visitor.User;

public class UserServiceImpl implements UserService {
    private UserDAO userDAO;

    public UserServiceImpl(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public User login(String email, String password) {
        User user = userDAO.findUserByEmailAndPassword(email, password);
        
        if (user == null) {
            throw new RuntimeException("Email ou mot de passe incorrect");
        }
        
        return user;
    }
}


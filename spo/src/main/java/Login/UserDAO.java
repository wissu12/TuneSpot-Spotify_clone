package Login;

import Visitor.User;

public interface UserDAO {
    User findUserByEmailAndPassword(String email, String password);
}

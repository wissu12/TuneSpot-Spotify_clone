package Login;

import Visitor.User;

public interface UserService {
    User login(String email, String password);
}


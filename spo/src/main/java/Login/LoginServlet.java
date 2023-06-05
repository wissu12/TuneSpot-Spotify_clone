package Login;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import BD.MySQLDatabase;
import Visitor.User;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	  private UserService userService;
	    
	    @Override
	    public void init() throws ServletException {
	        super.init();
	        UserDAO userDAO = null;
			try {
				userDAO = new UserDAOImpl(MySQLDatabase.getConnection());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        userService = new UserServiceImpl(userDAO);
	    }
	    
	    @Override

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        
	        try {
	            User user = userService.login(email, password);
	            
	            // Si l'utilisateur existe, on crée une session et on redirige vers la page d'accueil
	            HttpSession session = request.getSession();
	            session.setAttribute("user", user);
	            session.setAttribute("id", user.getId());

                
                int id = (Integer) session.getAttribute("id");
	    
	            response.sendRedirect(request.getContextPath() + "/Spotify/index.jsp");
	        } catch (RuntimeException e) {
	            // Si l'utilisateur n'existe pas, on renvoie un message d'erreur et on reste sur la page de login
	            request.setAttribute("errorMessage", e.getMessage());
	            RequestDispatcher rd = request.getRequestDispatcher("login");
	            rd.forward(request, response);
	        }
	    }

}

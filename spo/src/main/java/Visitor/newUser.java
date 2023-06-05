package Visitor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import BD.MySQLDatabase;

@MultipartConfig
public class newUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	 
    private Connection conn;

    public newUser() {
    	   try {
               conn = MySQLDatabase.getConnection();
           } catch (SQLException e) {
               e.printStackTrace();
           }
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String adresse = request.getParameter("adresse");
			String tel = request.getParameter("tel");
			
			String uploadFolder ="C:/eclipse_workspace/spo/src/main/webapp/User/images";
		    Part filePart = request.getPart("file");
		    String fileName = filePart.getSubmittedFileName();
		    Path filePath = Paths.get(uploadFolder, fileName);
		    String path =   fileName;
		    Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
		     
		    System.out.println("path: " + getServletContext().getRealPath("/images"));
		      User user = new User();
  	     
		      boolean emailExists = false;
		      
		      
		      String query = "SELECT COUNT(*) FROM user WHERE email = ?";
		      try (PreparedStatement statement = conn.prepareStatement(query)) {
		          statement.setString(1, email);
		          ResultSet resultSet = statement.executeQuery();
		          if (resultSet.next()) {
		              int count = resultSet.getInt(1);
		              
		              emailExists = (count > 0);
		          }
		      } catch (SQLException e) {
		         
		          e.printStackTrace();
		      }
		      
		      if (emailExists) {

		    	    System.out.println("L'e-mail est déjà appartient à un autre utilisateur");
		    	    String errorMessage = "L'e-mail est déjà appartient à un autre utilisateur";
		    	    response.sendRedirect("Sinscrire?error=" + URLEncoder.encode(errorMessage, "UTF-8"));
//
//		    	    response.sendRedirect("Sinscrire");
		    	    
		    	    
		    	} else {
		    	    
		  	        user.setNom(nom);
		  	        user.setPrenom(prenom);
		  	        user.setEmail(email);
		  	        user.setPassword(password);
		  	        user.setImage(path);
		  	        user.setAdresse(adresse);
		  	        user.setTel(tel);
		  	       

		  	        AddSongVisitor visitor = new AddSongVisitor(conn);
		  	        user.accept(visitor);
		  	        
		  	      
		  	  String successMessage = "Utilisateur inscrit avec succès.";
		  	response.sendRedirect("home?success=" + URLEncoder.encode(successMessage, "UTF-8"));


//		  	        response.sendRedirect("home");
		  
		    	}
		      
		  
	 
	}

}

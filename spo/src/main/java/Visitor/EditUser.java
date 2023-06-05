package Visitor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
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
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private Connection conn;

    public EditUser() {
    	   try {
               conn = MySQLDatabase.getConnection();
           } catch (SQLException e) {
               e.printStackTrace();
           }
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		    HttpSession session2 = request.getSession(false);
		    int id = (Integer) session2.getAttribute("id");
		    






String photo = request.getParameter("photo");


String nom = request.getParameter("nom");
String prenom = request.getParameter("prenom");

String password = request.getParameter("password");
String adresse = request.getParameter("adresse");
String tel = request.getParameter("tel");

 Part filePart = request.getPart("profile");
 
 String email = request.getParameter("email");
 boolean emailExists = false;
 
 String query = "SELECT COUNT(*) FROM user WHERE email = ? AND id <> ?";
 try (PreparedStatement statement = conn.prepareStatement(query)) {
     statement.setString(1, email);
     statement.setInt(2, id); // Remplacez id par la valeur de l'ID de session

     try (ResultSet resultSet = statement.executeQuery()) {
         if (resultSet.next()) {
             int count = resultSet.getInt(1);
             if (count > 0) {
                 // L'email existe déjà dans la table 'user' pour un autre utilisateur
                 emailExists = true;
                 response.sendRedirect("Spotify/profile.jsp");
             }
         }
     }
 } catch (SQLException e) {
     // Gérer les exceptions liées à l'exécution de la requête SQL
     e.printStackTrace();
 }
	

if(!emailExists) {
	if (filePart != null && filePart.getSize() > 0) {
		
		String uploadFolder ="C:/eclipse_workspace/spo/src/main/webapp/User/images";
		   
	    System.out.print(filePart);
	    String fileName = filePart.getSubmittedFileName();
	    Path filePath = Paths.get(uploadFolder, fileName);
	    String path =   fileName;

	    Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
	     

	      User user = new User();
	    user.setId(id);
	    user.setNom(nom);
	    user.setPrenom(prenom);
	    user.setEmail(email);
	    user.setPassword(password);
	    user.setImage(path);
	    user.setTel(tel);
	    user.setAdresse(adresse);
	 
	   

	    EditUserVisitor visitor = new EditUserVisitor(conn);
	    user.accept(visitor);
	    response.sendRedirect("Spotify/index.jsp");
	 
	} else {
	      User user = new User();
		    user.setId(id);
	        user.setNom(nom);
	        user.setPrenom(prenom);
	        user.setEmail(email);
	        user.setPassword(password);
	        user.setImage(photo);
	        user.setTel(tel);
	        user.setAdresse(adresse);

	       

	        EditUserVisitor visitor = new EditUserVisitor(conn);
	        user.accept(visitor);
	        response.sendRedirect("Spotify/index.jsp");

	    
	  
	}

	 	
}



 



	 
	}


}

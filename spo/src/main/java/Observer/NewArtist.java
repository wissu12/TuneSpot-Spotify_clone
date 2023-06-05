package Observer;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;



import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.*;

import BD.MySQLDatabase;



import jakarta.servlet.annotation.MultipartConfig;


import jakarta.servlet.http.Part;
@MultipartConfig

@WebServlet("/ajouter-artist")
public class NewArtist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ArtistDAO artistDAO = new ArtistDAO();
	private Connection conn;

    public NewArtist() {
        try {
            conn = MySQLDatabase.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomArtiste = request.getParameter("nom_artist");
    	String uploadFolder ="C:/eclipse_workspace/spo/src/main/webapp/Spotify/image_artiste";
	    Part filePart = request.getPart("file");
	    String fileName = filePart.getSubmittedFileName();
	    Path filePath = Paths.get(uploadFolder, fileName);
	    String path = fileName;
	    Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
	     Artist artist = new Artist(nomArtiste, path);
	     
         
     	
   	  
         artistDAO.ajouterChanson(artist);


         response.sendRedirect("Spotify/index.jsp");

    }

}

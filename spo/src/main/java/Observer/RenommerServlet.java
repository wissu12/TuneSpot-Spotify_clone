package Observer;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.*;

import BD.MySQLDatabase;



import jakarta.servlet.annotation.MultipartConfig;


import jakarta.servlet.http.Part;
@MultipartConfig

@WebServlet("/ajouter-chanson3")
/**
 * Servlet implementation class RenommerServlet
 */



public class RenommerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SongDAO songDAO = new SongDAO();

       
  

	private Connection conn;

    public RenommerServlet() {
        try {
            conn = MySQLDatabase.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomChanson = request.getParameter("nom_chanson");
        String id_artiste = request.getParameter("artiste");

        System.out.println(  "id de l'artiste :"+id_artiste);
        
        String requete = "SELECT id,image,audio FROM song ORDER BY id DESC LIMIT 1";
	    Statement statement;
		try {
			statement = conn.createStatement();
		      ResultSet resultat = statement.executeQuery(requete);
		      String dernierEnregistrement = null;
		      String dernierEnregistrementAudio = null;
		      int dernier_id;
		
		      if (resultat.next()) {
		    	  dernierEnregistrement = resultat.getString("image");
		    	  dernierEnregistrementAudio = resultat.getString("audio");
		    	  dernier_id = resultat.getInt("id");
		            if ((dernierEnregistrement == null)  && (dernierEnregistrementAudio == null) ) {
		            	dernierEnregistrement="-1.jpg";
		            
		            	int new_id=0;
		            
		                // Remplacer avec la requête SQL pour récupérer le dernier enregistrement
		                Part filePart = request.getPart("file");
		        		// Extraire le numéro de séquence du nom de fichier
		                String nomFichier = filePart.getSubmittedFileName();
		                String nomSansExtension = dernierEnregistrement.substring(0, dernierEnregistrement.lastIndexOf('.'));
		                String numeroSequence = nomSansExtension.substring(nomSansExtension.lastIndexOf('/') + 1);

		                // Ajouter 1 au numéro de séquence pour obtenir le nouveau numéro de séquence
		                int nouveauNumeroSequence = Integer.parseInt(numeroSequence) + 1;

		                // Concaténer le chemin d'accès et le nouveau numéro de séquence avec l'extension .jpg pour former le nouveau nom de fichier
		                String nouveauNomFichier = nouveauNumeroSequence + ".jpg";

		                // Enregistrer le fichier avec le nouveau nom dans le dossier correspondant
		                String uploadFolder = "C:/eclipse_workspace/spo/src/main/webapp/Spotify/image_songs";
		                Path filePath = Paths.get(uploadFolder, nouveauNomFichier);
		                Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
		        	    String image=nouveauNomFichier;
		        	    
		        	    dernierEnregistrementAudio = "-1.mp3";
		        	 // Remplacer avec la requête SQL pour récupérer le dernier enregistrement audio

		        	 Part audioPart = request.getPart("audio");
		        	 String nomAudio = audioPart.getSubmittedFileName();
		        	 String nomAudioSansExtension = dernierEnregistrementAudio.substring(0, dernierEnregistrementAudio.lastIndexOf('.'));
		        	 String numeroSequenceAudio = nomAudioSansExtension.substring(nomAudioSansExtension.lastIndexOf('/') + 1);

		        	 // Ajouter 1 au numéro de séquence pour obtenir le nouveau numéro de séquence
		        	 int nouveauNumeroSequenceAudio = Integer.parseInt(numeroSequenceAudio) + 1;
		        	 
		        	 // Concaténer le chemin d'accès et le nouveau numéro de séquence avec l'extension .mp3 pour former le nouveau nom de fichier
		        	 String nouveauNomAudio = nouveauNumeroSequenceAudio + ".mp3";

		        	 // Enregistrer le fichier audio avec le nouveau nom dans le dossier correspondant
		        	 String uploadAudioFolder = "C:/eclipse_workspace/spo/src/main/webapp/Spotify/songs_spo";
		        	 Path audioPath = Paths.get(uploadAudioFolder, nouveauNomAudio);
		        	 Files.copy(audioPart.getInputStream(), audioPath, StandardCopyOption.REPLACE_EXISTING);

		        	 String audio = nouveauNomAudio;

		             Song song = new Song(new_id,nomChanson, image,audio,id_artiste);
	             
        	
				    	  
		    	         songDAO.ajouterChanson(song);
		    	     
		    	         System.out.println(  new_id);
		    	   	  String successMessage = "nouvelle chanson  ajoutée avec succès.";
		    	   	  response.sendRedirect("Spotify/index.jsp?success=" + URLEncoder.encode(successMessage, "UTF-8"));

//		    
//		    	         response.sendRedirect("Spotify/index.jsp");
//		             response.sendRedirect(request.getContextPath() + "/Spotify/index.jsp");

		            } else {
		            	
		            	int new_id;
		            	new_id=dernier_id+1;
		            	   System.out.println(  dernier_id);
		            	   System.out.println(  new_id);
		            	 // Remplacer avec la requête SQL pour récupérer le dernier enregistrement
		                Part filePart = request.getPart("file");
		        		// Extraire le numéro de séquence du nom de fichier
		                String nomFichier = filePart.getSubmittedFileName();
		                String nomSansExtension = dernierEnregistrement.substring(0, dernierEnregistrement.lastIndexOf('.'));
		                String numeroSequence = nomSansExtension.substring(nomSansExtension.lastIndexOf('/') + 1);

		                // Ajouter 1 au numéro de séquence pour obtenir le nouveau numéro de séquence
		                int nouveauNumeroSequence = Integer.parseInt(numeroSequence) + 1;

		                // Concaténer le chemin d'accès et le nouveau numéro de séquence avec l'extension .jpg pour former le nouveau nom de fichier
		                String nouveauNomFichier = nouveauNumeroSequence + ".jpg";

		                // Enregistrer le fichier avec le nouveau nom dans le dossier correspondant
		                String uploadFolder = "C:/eclipse_workspace/spo/src/main/webapp/Spotify/image_songs";
		                Path filePath = Paths.get(uploadFolder, nouveauNomFichier);
		                Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
		        	    String image=nouveauNomFichier;
		        	       
		        	
		        	 // Remplacer avec la requête SQL pour récupérer le dernier enregistrement audio

		        	 Part audioPart = request.getPart("audio");
		        	 String nomAudio = audioPart.getSubmittedFileName();
		        	 String nomAudioSansExtension = dernierEnregistrementAudio.substring(0, dernierEnregistrementAudio.lastIndexOf('.'));
		        	 String numeroSequenceAudio = nomAudioSansExtension.substring(nomAudioSansExtension.lastIndexOf('/') + 1);

		        	 // Ajouter 1 au numéro de séquence pour obtenir le nouveau numéro de séquence
		        	 int nouveauNumeroSequenceAudio = Integer.parseInt(numeroSequenceAudio) + 1;

		        	 // Concaténer le chemin d'accès et le nouveau numéro de séquence avec l'extension .mp3 pour former le nouveau nom de fichier
		        	 String nouveauNomAudio = nouveauNumeroSequenceAudio + ".mp3";

		        	 // Enregistrer le fichier audio avec le nouveau nom dans le dossier correspondant
		        	 String uploadAudioFolder = "C:/eclipse_workspace/spo/src/main/webapp/Spotify/songs_spo";
		        	 Path audioPath = Paths.get(uploadAudioFolder, nouveauNomAudio);
		        	 Files.copy(audioPart.getInputStream(), audioPath, StandardCopyOption.REPLACE_EXISTING);

		        	 String audio = nouveauNomAudio;

		        	   Song song = new Song(new_id,nomChanson,image,audio,id_artiste);
				    	  
		    	         songDAO.ajouterChanson(song);
		    	         System.out.println(  new_id);
		    	
			    	   	  String successMessage = "nouvelle chanson  ajoutée avec succès.";
			    	   	  response.sendRedirect("Spotify/index.jsp?success=" + URLEncoder.encode(successMessage, "UTF-8"));

		            }
		          
		      }else {
		    	  dernierEnregistrement="-1.jpg";
		    	  
	            	dernier_id=0;
	            	int new_id;
	            	new_id=0;
	                // Remplacer avec la requête SQL pour récupérer le dernier enregistrement
	                Part filePart = request.getPart("file");
	        		// Extraire le numéro de séquence du nom de fichier
	                String nomFichier = filePart.getSubmittedFileName();
	                String nomSansExtension = dernierEnregistrement.substring(0, dernierEnregistrement.lastIndexOf('.'));
	                String numeroSequence = nomSansExtension.substring(nomSansExtension.lastIndexOf('/') + 1);

	                // Ajouter 1 au numéro de séquence pour obtenir le nouveau numéro de séquence
	                int nouveauNumeroSequence = Integer.parseInt(numeroSequence) + 1;

	                // Concaténer le chemin d'accès et le nouveau numéro de séquence avec l'extension .jpg pour former le nouveau nom de fichier
	                String nouveauNomFichier = nouveauNumeroSequence + ".jpg";

	                // Enregistrer le fichier avec le nouveau nom dans le dossier correspondant
	                String uploadFolder = "C:/eclipse_workspace/spo/src/main/webapp/Spotify/image_songs";
	                Path filePath = Paths.get(uploadFolder, nouveauNomFichier);
	                Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
	        	    String image=nouveauNomFichier;
	        	    
	        	    
	        	    
	        	    dernierEnregistrementAudio = "-1.mp3";
	        	 // Remplacer avec la requête SQL pour récupérer le dernier enregistrement audio

	        	 Part audioPart = request.getPart("audio");
	        	 String nomAudio = audioPart.getSubmittedFileName();
	        	 String nomAudioSansExtension = dernierEnregistrementAudio.substring(0, dernierEnregistrementAudio.lastIndexOf('.'));
	        	 String numeroSequenceAudio = nomAudioSansExtension.substring(nomAudioSansExtension.lastIndexOf('/') + 1);

	        	 // Ajouter 1 au numéro de séquence pour obtenir le nouveau numéro de séquence
	        	 int nouveauNumeroSequenceAudio = Integer.parseInt(numeroSequenceAudio) + 1;

	        	 // Concaténer le chemin d'accès et le nouveau numéro de séquence avec l'extension .mp3 pour former le nouveau nom de fichier
	        	 String nouveauNomAudio = nouveauNumeroSequenceAudio + ".mp3";

	        	 // Enregistrer le fichier audio avec le nouveau nom dans le dossier correspondant
	        	 String uploadAudioFolder = "C:/eclipse_workspace/spo/src/main/webapp/Spotify/songs_spo";
	        	 Path audioPath = Paths.get(uploadAudioFolder, nouveauNomAudio);
	        	 Files.copy(audioPart.getInputStream(), audioPath, StandardCopyOption.REPLACE_EXISTING);

	        	 String audio = nouveauNomAudio;

	        	       

	        	   Song song = new Song(new_id,nomChanson,image,audio,id_artiste);
	        	   System.out.println(  new_id);
	               
			    	  
	    	         songDAO.ajouterChanson(song);
//	    	         response.sendRedirect(request.getContextPath() + "/Spotify/index.jsp");
		    	   	  String successMessage = "nouvelle chanson  ajoutée avec succès.";
		    	   	  response.sendRedirect("Spotify/index.jsp?success=" + URLEncoder.encode(successMessage, "UTF-8"));

	           
		      }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }
}

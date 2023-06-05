package Observer;




import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import BD.MySQLDatabase;
import Visitor.User;

public class ArtistDAO {
  

    private Connection conn;

    public ArtistDAO() {
    	   try {
               conn = MySQLDatabase.getConnection();
           } catch (SQLException e) {
               e.printStackTrace();
           }
    }


    public void ajouterChanson(Artist artist) {
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO artist (nom, image) VALUES (?, ?)");
        
     
            ps.setString(1, artist.getNom());
            ps.setString(2, artist.getImage());
         
            ps.executeUpdate();
            notifierUtilisateursParEmail(artist); 

         
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private List<User> getUserList() {
        List<User> utilisateurs = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM user");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                User utilisateur = new User(rs.getInt("id"), rs.getString("nom"),rs.getString("prenom"), rs.getString("email"),rs.getString("password"),rs.getString("photo"));
//                utilisateurs.add(utilisateur);
                User utilisateur = new User();
                utilisateur.setId(rs.getInt("id"));
                utilisateur.setNom(rs.getString("nom"));
                utilisateur.setPrenom(rs.getString("prenom"));
                utilisateur.setEmail(rs.getString("email"));
                utilisateur.setPassword(rs.getString("password"));
                utilisateur.setImage(rs.getString("photo"));
                utilisateur.setTel(rs.getString("tel"));
                utilisateur.setAdresse(rs.getString("adresse"));
                utilisateurs.add(utilisateur);

              
            }
            for (User utilisateur : utilisateurs) {
                System.out.println("Nom: " + utilisateur.getNom());
                System.out.println("Email: " + utilisateur.getEmail());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return utilisateurs;
    }
    
    public void notifierUtilisateursParEmail(Artist artist) {
        try {
            // Récupérer tous les utilisateurs de la table user
            List<User> utilisateurs = getUserList();

            final String username = "wissal.elouafy@etu.uae.ac.ma";
            final String password = "frsasyqdsphfgryx";

            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            Session session = Session.getInstance(props,
              new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
              });
            // Parcourir la liste des utilisateurs et envoyer un email à chacun
            for (User utilisateur : utilisateurs) {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(username));
           
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(utilisateur.getEmail()));
//                message.setSubject("Nouveau artiste ajoutée : ");
//                message.setText("Un nouveau artiste  a été ajouté à la base de données de Spotify : ");
                message.setSubject("Un nouveau artiste  ajouté : " + artist.getNom());
                message.setText("Un nouveau artiste  a été ajouté à la base de données de Spotify : " +
                		artist.getNom() );
           
                Transport.send(message);
                

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



}


package Visitor;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;


public class AddSongVisitor implements Visitor {
    private Connection conn;
    private PreparedStatement stmt;

    public AddSongVisitor(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void visit(User user) {
        try {
            stmt = conn.prepareStatement("INSERT INTO user (nom, prenom, email,password,photo,tel,adresse) VALUES (?, ?, ?, ?,?,?, ?)");
            stmt.setString(1, user.getNom());
            stmt.setString(2, user.getPrenom());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPassword());
            stmt.setString(5, user.getImage());
            stmt.setString(6, user.getTel());
            stmt.setString(7, user.getAdresse());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}

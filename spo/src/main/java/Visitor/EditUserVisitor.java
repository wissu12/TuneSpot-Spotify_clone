package Visitor;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;


public class EditUserVisitor implements Visitor {
    private Connection conn;
    private PreparedStatement stmt;

    public EditUserVisitor(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void visit(User user) {
        try {
            stmt = conn.prepareStatement("UPDATE user SET nom=?, prenom=?, email=?, password=?,  photo=?,tel=?,adresse=? WHERE id=?");
            stmt.setString(1, user.getNom());
            stmt.setString(2, user.getPrenom());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPassword());
            stmt.setString(5, user.getImage());
            stmt.setString(6, user.getTel());
            stmt.setString(7, user.getAdresse());
            stmt.setInt(8, user.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}

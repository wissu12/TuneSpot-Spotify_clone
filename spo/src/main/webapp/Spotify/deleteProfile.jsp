<%@ page import="java.sql.*" %>
<%@ page import="BD.MySQLDatabase" %>

<%
    // Get the user id from the request parameter
    String id = request.getParameter("id");

    // Connect to the database
    Connection conn = MySQLDatabase.getConnection();

    // Prepare the SQL statement to delete the user
    PreparedStatement stmt = conn.prepareStatement("DELETE FROM user WHERE id=?");
    stmt.setString(1, id);

    // Execute the statement and redirect back to the user list
    stmt.executeUpdate();
    response.sendRedirect("../login");
%>

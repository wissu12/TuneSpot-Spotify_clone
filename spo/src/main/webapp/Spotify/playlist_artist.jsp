<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@page import= "java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page  import="java.util.ArrayList"%>


<%@page import= "BD.MySQLDatabase" %>
<%@page import= "Observer.Song" %>
<%@page import= "Observer.Artist" %>
<%@page import= "Visitor.User" %>
<%@page import ="java.util.ArrayList"%>
<%@page import= "Observer.Artist" %>
<%@page import ="java.util.List"%>



<% 

%>
       <%
   String id_arti = request.getParameter("id");
%>
<% 
try {
    Connection con = MySQLDatabase.getConnection();
    ResultSet rs = con.createStatement().executeQuery("Select * from song  where id_artiste= " + id_arti);
    ArrayList<Song> songs = new ArrayList<Song>();
    while (rs.next()) {
        Song song = new Song(rs.getInt("id"),rs.getString("titre"),rs.getString("image"),rs.getString("audio"));
        songs.add(song);
    }
    request.setAttribute("songs", songs); // Passer la liste des chansons en tant qu'attribut à la requête
} catch (SQLException e) {
    e.printStackTrace();
}
%>

<% 
try {
	
   /*  Connection con2 = MySQLDatabase.getConnection();
    ResultSet rs2 = con2.createStatement().executeQuery("SELECT * FROM song ORDER BY id ASC LIMIT 6 ");
    */
    Connection con2 = MySQLDatabase.getConnection();
    PreparedStatement pstmt = con2.prepareStatement("SELECT * FROM song WHERE id_artiste = ? ORDER BY id ASC LIMIT 6");
    pstmt.setString(1, id_arti);
    ResultSet rs2 = pstmt.executeQuery();
    
    ArrayList<Song> songs2 = new ArrayList<Song>();
    while (rs2.next()) {
        Song song2 = new Song(rs2.getInt("id"),rs2.getString("titre"),rs2.getString("image"),rs2.getString("audio"));

        songs2.add(song2);
    }
    request.setAttribute("songs2", songs2); // Passer la liste des chansons en tant qu'attribut à la requête
} catch (SQLException e) {
    e.printStackTrace();
}
%>
<% 
try { 
	/* String id_user=session.getAttribute("userId");*/
    String userId = session.getId();
    Connection con3 = MySQLDatabase.getConnection();

    ResultSet rs3 = con3.createStatement().executeQuery("SELECT * FROM user where id= " + userId);
        User user = new User(rs3.getInt("id"),rs3.getString("nom"),rs3.getString("prenom"),rs3.getString("email"),rs3.getString("password"),rs3.getString("photo")
        		,rs3.getString("tel"),rs3.getString("adresse")
        		);
       
   
} catch (SQLException e) {
    e.printStackTrace();
}
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <title>Document</title>
</head>
<body>
    <header>
        <div class="menu_side">
            <h1>Playlist</h1>
              <div class="playlist">
               <h4 class="active"><span></span><i class="bi bi-music-note-beamed"></i><a style="text-decoration:none;color:white;"href="index.jsp">All songs</a></h4>
                <h4><span></span><i class="bi bi-music-note-beamed"></i><a style="text-decoration:none;color:white"href="newSong.jsp">New song</a></h4>
                <h4><span></span><i class="bi bi-music-note-beamed"></i><a style="text-decoration:none;color:white"href="newArtist.jsp">Add artist</a></h4>
            </div>
            
                 
            <div class="menu_song">
            
            <% if (((ArrayList<Song>) request.getAttribute("songs")).isEmpty()) { %>
					
					<% } else { %>
					  <h3 style=" margin-bottom:15px;margin-left:20px;margin-top:-10px;">Latest songs</h3>
					  
					   <div class="pop_song">
					    <% for (Song songObj2 : (ArrayList<Song>) request.getAttribute("songs2")) { %>
                        <li class="songItem2">
                        
                           <span><%= songObj2.getId()%></span>
                    			<img src="image/<%= songObj2.getImage() %>" alt="">
                    			     <h5 class="songName2">
					                      <%= songObj2.getTitle() %>
					                        <div class="subtitle"><%= songObj2.getTitle() %></div>
					                  </h5>
					                    <i class="bi playListPLay bi-play-circle-fill" id="<%= songObj2.getId() %>"></i>
     
                        </li>
                    <% } %>
					   </div>
					   
					<% } %>
           
               
                   
                    
                    
                    
             
               
       
            </div>
            
        </div>
        <div class="song_side">
            <nav>
                <ul>
                    <li><a style="text-decoration:none;color:white;"href="index.jsp">Songs</a> <span></span></li>
                    <li><a style="text-decoration:none;color:white;"href="../LogoutServlet">Logout</a> </li>
               
                  
          
                </ul>
             
               <% 
try { 
 
    Connection con3 = MySQLDatabase.getConnection();
    HttpSession session2 = request.getSession(false);


	    int id = (Integer) session.getAttribute("id");


    ResultSet rs3 = con3.createStatement().executeQuery("SELECT * FROM user where id= " +id);
    
    if (rs3.next()) {
        User user = new User(rs3.getInt("id"),rs3.getString("nom"),rs3.getString("prenom"),
        		rs3.getString("email"),rs3.getString("password"),rs3.getString("photo")	,rs3.getString("tel"),rs3.getString("adresse"));
%>

    <div class="user">
    <p> <%rs3.getString("nom"); %></p>
   <a href="profile.jsp">
 	 <img src="../User/images/<%=rs3.getString("photo")%>" alt="" title="<%=rs3.getString("nom") %> <%=rs3.getString("prenom") %>" />
</a>
    </div>
<%
    }
} catch (SQLException e) {
    e.printStackTrace();
}
%>
            </nav>
            <div class="content" >
                           <% 
try { 
 
    Connection con3 = MySQLDatabase.getConnection();
    HttpSession session2 = request.getSession(false);



    ResultSet rs4 = con3.createStatement().executeQuery("SELECT * FROM artist where id= " +id_arti);
    
    if (rs4.next()) {
    	Artist artiste = new Artist(rs4.getInt("id"),rs4.getString("nom"),rs4.getString("image"));%>
                
                 <div  style="margin-top:0px;margin-left:10px;">
				         <h1 font-size:40px;><%=rs4.getString("nom")%></h1>
				   </div>
                  <div class="artiste" style="margin-top:20px;">

				
				 	 <img style="width: 160px; height: 160px; border-radius: 50%; position: absolute;  " src="../Spotify/image_artiste/<%=rs4.getString("image")%>" alt="" />
				
				   </div>
				
				    
       
  

   			
            </div>
            
            <%
    }
} catch (SQLException e) {
    e.printStackTrace();
}
%>
            <div class="popular_song" style="margin-top:90px;">
                <div class="h4">
                <%
				  HttpSession session2 = request.getSession(false);
				  if (session != null) {
				    String sessionId = session.getId();
				    int id = (Integer) session.getAttribute("id");
				    %>
				 
				        <% }
				%>
                    <h4>All Songs of this artist</h4>
                    <div class="btn_s">
                        <i id="left_scroll" class="bi bi-arrow-left"></i>
                        <i id="right_scroll" class="bi bi-arrow-right"></i>
                    </div>
                </div>
                <% if (((ArrayList<Song>) request.getAttribute("songs")).isEmpty()) { %>
					   <div style="margin-top:30px;color:red;">Aucune chanson trouvée</div>
					<% } %>
					   <div class="pop_song">
					      <% for (Song songObj : (ArrayList<Song>) request.getAttribute("songs")) { %>
					         <li class="songItem">
					            <div class="img_play">
					               <img id="songImage"  src="image/<%= songObj.getImage() %>" alt="" srcset="">
					               <i class="bi playListPLay bi-play-circle-fill" id="<%= songObj.getId() %>"></i>
					            </div>
					            <h5 class="songName"><%= songObj.getTitle() %>
					               <br>
					               <div class="subtitle"  id="songTitle"><%= songObj.getTitle() %></div>
					            </h5>
					         </li>
					      <% } %>
					   </div>
				


            </div> 
          
 
          
        </div>
        <div class="master_play">
            <div class="wave">
                <div class="wave1"></div>
                <div class="wave1"></div>
                <div class="wave1"></div>
            </div>
            <img src="image/onmyway.webp"id="poster_master_play" alt="" srcset="">
            <h5 id="title">
                On my way <br>
                <div class="subtitle">Alan walker</div>
           </h5>
           <div class="icon">
            <i class="bi bi-skip-start-fill" id="back"></i>
            <i class="bi bi-play-fill" id="masterplay"></i>
          
            <i class="bi bi-skip-end-fill" id="next"></i>
           </div>
           <span id="currentStart">0:00</span>
           <div class="bar">
              <input type="range" id="seek" min="0" max="100" value="0">
                <div class="bar2" id="bar2"></div> 
                <div class="dot"></div>
            </div>
           <span id="currentEnd">0:00</span>
           <div class="vol">
            <i class="bi bi-volume-down-fill" id="vol_icon"></i>
            <input type="range" id="vol" min="0" max="100" value="30">
            <div class="vol_bar"></div>
            <div class="dot" id="vol_dot"></div>

               
           </div>
           
           
        </div>
    </header>
    <script>
        let songs = [];

<% for (int j = 0; j < ((ArrayList<Song>) request.getAttribute("songs")).size(); j++) { %>
const song<%=j%> = {
    id: "<%= ((ArrayList<Song>) request.getAttribute("songs")).get(j).getId() %>",
    songName: "<%= ((ArrayList<Song>) request.getAttribute("songs")).get(j).getTitle() %>",
    filePath: "songs/<%= ((ArrayList<Song>) request.getAttribute("songs")).get(j).getAudioTitle() %>",
    coverPath: "image/<%= ((ArrayList<Song>) request.getAttribute("songs")).get(j).getImage() %>"
};
songs.push(song<%=j%>);

<% } %>
    </script>
    <script src="js/app.js"></script>
        <script>
        let songs2 = [];

<% for (int j = 0; j < ((ArrayList<Song>) request.getAttribute("songs2")).size(); j++) { %>
const song<%=j%> = {
    id: "<%= ((ArrayList<Song>) request.getAttribute("songs2")).get(j).getId() %>",
    songName: "<%= ((ArrayList<Song>) request.getAttribute("songs2")).get(j).getTitle() %>",
    filePath: "songs/<%= ((ArrayList<Song>) request.getAttribute("songs2")).get(j).getAudioTitle() %>",
    coverPath: "image/<%= ((ArrayList<Song>) request.getAttribute("songs2")).get(j).getImage() %>"
};
songs.push(song<%=j%>);

<% } %>
    </script>
    <script src="js/app2.js"></script>

</body>
</html>
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
<%@page import ="java.util.List"%>



<% 

%>
 
<% 
try {
    Connection con = MySQLDatabase.getConnection();
    ResultSet rs = con.createStatement().executeQuery("Select * from song ");
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
    Connection con = MySQLDatabase.getConnection();
    ResultSet rs = con.createStatement().executeQuery("Select * from artist ");
    ArrayList<Artist> artists = new ArrayList<Artist>();
    while (rs.next()) {
        Artist artist = new Artist(rs.getInt("id"),rs.getString("nom"),rs.getString("image"));
        artists.add(artist);
    }
    request.setAttribute("artists", artists); // Passer la liste des chansons en tant qu'attribut à la requête
} catch (SQLException e) {
    e.printStackTrace();
}
%>
<% 
try {
/* 	String req="SELECT * FROM song ORDER BY id DESC LIMIT 6";
    Connection con2 = MySQLDatabase.getConnection();
    ResultSet rs2 = con2.createStatement().executeQuery(req+" ORDER BY id ASC"); */
    Connection con2 = MySQLDatabase.getConnection();
    ResultSet rs2 = con2.createStatement().executeQuery("SELECT * FROM song ORDER BY id ASC LIMIT 5 ");
    ArrayList<Song> songs2 = new ArrayList<Song>();
    while (rs2.next()) {
        Song song2 = new Song(rs2.getInt("id"),rs2.getString("titre"),rs2.getString("image"),rs2.getString("audio"));
     /*    song.setId(rs.getInt("id"));
        song.setTitle(rs.getString("titre"));
        song.setAudioTitle(rs.getString("audio"));
        song.setImage(rs.getString("image")); */
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
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <title>Document</title>
</head>
<body>
    <header>
        <div class="menu_side">
            <h1>TuneSpot</h1>
              <div class="playlist" style="margin-top:30px;">
               <h4 class="active"><span></span><i class="bi bi-music-note-beamed"></i><a style="text-decoration:none;color:white;"href="index.jsp">All songs</a></h4>
                <h4><span></span><i class="bi bi-music-note-beamed"></i><a style="text-decoration:none;color:white"href="newSong.jsp">New song</a></h4>
                <h4><span></span><i class="bi bi-music-note-beamed"></i><a style="text-decoration:none;color:white"href="newArtist.jsp">Add artist</a></h4>
            </div>
            <div class="menu_song">
               <h3 style=" margin-bottom:15px;margin-left:20px;margin-top:-10px;">Latest songs</h3>
            
                  
                    <% for (Song songObj2 : (ArrayList<Song>) request.getAttribute("songs2")) { %>
                        <li class="songItem2">
                           <%-- <span><%= songObj2.getId() %></span> --%>
                    			<img src="image_songs/<%= songObj2.getImage() %>" alt="">
                    			     <h5 class="songName2">
					                      <%= songObj2.getTitle() %>
					                        <div class="subtitle"><%= songObj2.getTitle() %></div>
					                  </h5>
					                    <i class="bi playListPLay bi-play-circle-fill" id="<%= songObj2.getId() %>"></i>
     
                        </li>
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
            <div class="content">
                <h1>Music Word</h1>
                <br>
                <p style="font-size:14px;color:#0ed1f0">"Trouvez votre rythme, partout et a tout moment,
					Explorez de nouveaux horizons musicaux en un clin d'oeil,
				
                </p>
                  <p style="font-size:14px;color:#0ed1f0">
					Creez votre playlist ideale pour chaque humeur,
					Vivez la musique comme jamais auparavant."
                </p>

   				 
                <div class="buttons">
                    <button>   <a style="color:white" href="newSong.jsp">New Song </a></button>
                 
                    <button><a style="color:white" href="newArtist.jsp">New artist</a></button>
                </div>
            </div>
            <div class="popular_song">
                <div class="h4">
                <%
				  HttpSession session2 = request.getSession(false);
				  if (session != null) {
				    String sessionId = session.getId();
				    int id = (Integer) session.getAttribute("id");
				    %>
				
				        <% }
				%>
                    <h4>All Songs</h4>
                    <div class="btn_s">
                        <i id="left_scroll" class="bi bi-arrow-left"></i>
                        <i id="right_scroll" class="bi bi-arrow-right"></i>
                    </div>
                </div>
                <div class="pop_song">
                    <% for (Song songObj : (ArrayList<Song>) request.getAttribute("songs")) { %>
                        <li class="songItem">
                            <div class="img_play">
                            
                                <img class="songImage"  src="image_songs/<%= songObj.getImage() %>" alt="" srcset="">
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
            <div class="popular_artists">
                <div class="h4">
                    <h4>All artists</h4>
                    <div class="btn_s">
                        <i id="left_scrolls" class="bi bi-arrow-left"></i>
                        <i id="right_scrolls" class="bi bi-arrow-right"></i>
                    </div>
                </div>
                
                <div class="item">
                    <% for (Artist artistObj : (ArrayList<Artist>) request.getAttribute("artists")) { %>
                        <li >
                            <a  href="show_songs.jsp?id= <%=  artistObj.getId()  %>">
							    <img src="image_artiste/<%= artistObj.getImage() %>" alt="" srcset="">
							</a>
                               <%--  <img   src="image/<%= artistObj.getImage() %>" alt="" srcset=""> --%>
                          
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
            <img src="image_songs/0.jpg" id="poster_master_play" alt="" srcset="">
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
            <i style="margin-top:5px;"class="bi bi-volume-down-fill" id="vol_icon"></i>
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
    filePath: "songs_spo/<%= ((ArrayList<Song>) request.getAttribute("songs")).get(j).getAudioTitle() %>",
    coverPath: "image_songs/<%= ((ArrayList<Song>) request.getAttribute("songs")).get(j).getImage() %>"
};
songs.push(song<%=j%>);

<% } %>
    </script>
    <script src="js/app.js"></script>
    <%--     <script>
        let songs2 = [];

<% for (int j = 0; j < ((ArrayList<Song>) request.getAttribute("songs2")).size(); j++) { %>
const song<%=j%> = {
    id: "<%= ((ArrayList<Song>) request.getAttribute("songs2")).get(j).getId() %>",
    songName: "<%= ((ArrayList<Song>) request.getAttribute("songs2")).get(j).getTitle() %>",
    filePath: "songs_spo/<%= ((ArrayList<Song>) request.getAttribute("songs2")).get(j).getAudioTitle() %>",
    coverPath: "image/<%= ((ArrayList<Song>) request.getAttribute("songs2")).get(j).getImage() %>"
};
songs.push(song<%=j%>);

<% } %>
    </script> --%>
<!--     <script src="js/app2.js"></script> -->

</body>
</html>
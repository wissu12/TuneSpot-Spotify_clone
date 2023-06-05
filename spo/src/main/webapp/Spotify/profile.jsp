<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@page import= "java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page  import="java.util.ArrayList"%>


<%@page import= "BD.MySQLDatabase" %>
<%@page import= "Observer.Song" %>

<%@page import ="java.util.ArrayList"%>
<%@page import ="java.util.List"%>



<% 

%>
 
<% 
try {
    Connection con = MySQLDatabase.getConnection();
    ResultSet rs = con.createStatement().executeQuery("Select * from song ORDER BY id ASC LIMIT 5 ");
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


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style2.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <title>Document</title>
    <style type="text/css">
    @import url("https://fonts.googleapis.com/css2?family=Rubik:wght@400;700&display=swap");



/* body {

  height: 100vh;
  width: 100vw;
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: "Rubik", sans-serif;
} */

.wrapper {
margin-top:-40px;
  background-color: white;
  border-radius: 15px;
  overflow: hidden;
  margin-left:200px;
  width:370px;
  height:460px;
  box-shadow: rgba(255, 255, 255, 0.1) 0px 1px 1px 0px inset,
    rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
    rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
}

.grey {
  color: #999999;
}

.profile-top {
 
   width:370px;
  height:170px;
  background-image: url("image_songs/city.jpg");
  background-position: center;
  background-size: cover;
  position: relative;
}


             .profile-pic{
                    height: 100%;
            width: 100%;

                }
.profile-image {

 
  background-position: center;
  background-size: cover;
  position: relative;
  width: 150px;
  height: 150px;
  overflow: hidden;
  border-radius: 50%;
  border: 3px solid white;
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translate(-50%, 50%);
}


       

.profile-bottom {
  margin-top: 75px;
  padding: 25px;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

.main-infos {
  display: flex;
  align-items: center;
  font-size: 22px;
  margin-bottom: 5px;
}

.name {
  font-weight: 600;
  margin-right: 15px;
}

.email2 {
  font-size: 34px;

}

.ville {
  font-size: 20px;
  margin-bottom: 75px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.ville ion-icon {
  margin-right: 5px;
  color: #388eff;
}

.profile-stats {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  width: 100%;
}

.stat-item:not(:last-child) {
  border-right: 1px solid black;
}

.stat {
  font-size: 20px;
  font-weight: 700;
}
    </style>
</head>
<body>
    <header>
        <div class="menu_side">
              <h1>TuneSpot</h1>
             <div class="playlist">
               <h4 class="active"><span></span><i class="bi bi-music-note-beamed"></i><a style="text-decoration:none;color:white;"href="index.jsp">All songs</a></h4>
                <h4><span></span><i class="bi bi-music-note-beamed"></i><a style="text-decoration:none;color:white"href="newSong.jsp">New song</a></h4>
                <h4><span></span><i class="bi bi-music-note-beamed"></i><a style="text-decoration:none;color:white"href="newArtist.jsp">Add artist</a></h4>
            </div>
                              <h3 style="margin-top:15px;margin-left:20px;">Latest songs</h3>
            
                          <div class="menu_song" style="margin-top:16px;">
               
               
            
                  
             
                     <% for (Song songObj : (ArrayList<Song>) request.getAttribute("songs")) { %>
                        <li class="songItem">
                      <%--      <span><%= songObj.getId() %></span> --%>
                    			<img src="image_songs/<%= songObj.getImage() %>" alt="">
                    			     <h5 class="songName">
					                      <%= songObj.getTitle() %>
					                        <div class="subtitle"><%= songObj.getTitle() %></div>
					                  </h5>
					                    <i class="bi playListPLay bi-play-circle-fill" id="<%= songObj.getId() %>"></i>
     
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


    ResultSet rs3 = con3.createStatement().executeQuery("SELECT * FROM user where id= " + id);
    
    if (rs3.next()) {
%>
    
             
                <div class="user">
                    <img src="../User/images/<%=rs3.getString(6)%>" alt="" title="<%=  rs3.getString(2) %>  <%=  rs3.getString(3) %>">
                </div>
            </nav>
            <div class="content">


            
                <div class="wrapper">
      <div class="profile-top">
        <div class="profile-image">
         <img src="../User/images/<%=rs3.getString(6)%>" alt="" class="profile-pic">
        </div>
      </div>

      <div class="profile-bottom">
        <div class="profile-infos">
             <div class="main-infos">
            <h3 class="name" style="margin-top:-20px;margin-left:30px;color :black;"><%=  rs3.getString(2) %>  <%=  rs3.getString(3) %> </h3>
            
            
          </div>
       
           <div class="email2" style="display:flex;margin-top:13px;font-size:20px;">
         
          <i class="fas fa-calendar  " style="margin-top:-15px;"></i>
          <p class="agegrey " style="font-size:15px;">Numéro de téléphone : <%=  rs3.getString(8) %></p>
         </div>
          <div class="email2" style="display:flex;margin-top:5px;font-size:20px;">
         
          <i class="fas fa-calendar  " style="margin-top:-15px;"></i>
          <p class="agegrey " style="font-size:15px;">Email : <%=  rs3.getString(4) %></p>
         </div>
         <div class="email2" style="display:flex;margin-top:5px;font-size:15px;">
         
          <i class="fas fa-calendar  " style="margin-top:-15px;font-size:20px;"></i>
             <p class="ville" style="font-size:15px;"><ion-icon name="location"></ion-icon><%=  rs3.getString(7) %></p>
         </div>
       
        
    
        </div>

        <div class="profile-stats" >

            <div class="buttons" style="display:flex;margin-top:20px;margin-bottom:70px;">
                     <a style=""  href="Edit_profile.jsp?id= <%=  rs3.getInt(1) %>">  <button style="margin-left:20px;margin-right:30px;">Modifier</button> </a>
                    <!--  <a style="margin-right:0px;"href=""> <button>Supprimer</button>  </a> -->
                     <a href="deleteProfile.jsp?id= <%=  rs3.getInt(1) %>"><button style="background-color:red;">Supprimer</button></a>
                     
             </div>
          
        </div>
      </div>
    </div>
    </div>
           
            <%
    }
} catch (SQLException e) {
    e.printStackTrace();
}
%>
          
        </div>
        <div class="master_play">
            <div class="wave">
                <div class="wave1"></div>
                <div class="wave1"></div>
                <div class="wave1"></div>
            </div>
            <img src="image_songs/0.jpg"id="poster_master_play" alt="" srcset="">
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
            <i style="margin-top:5px;" class="bi bi-volume-down-fill" id="vol_icon"></i>
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
    <script src="js/app2.js"></script>
        <script
      type="module"
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
    ></script>

</body>
</html>
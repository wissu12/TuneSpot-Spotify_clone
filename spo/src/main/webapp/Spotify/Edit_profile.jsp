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
<%@page import= "Visitor.User" %>



<% 

%>
 
<% 
try {
    Connection con = MySQLDatabase.getConnection();
    ResultSet rs = con.createStatement().executeQuery("Select * from song ORDER BY id ASC LIMIT 6 ");
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
        <link rel="stylesheet" href="css/edit.css">
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
.box{
    position: relative;
    width: 380px;
    height: 450px;
    background: white;
    border-radius: 8px;
    overflow: hidden;
    display:flex;
    flex-direction: column;
    /* padding-left: 40px; */

    
}
.box::before{
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 380px;
    height: 420px;
    background: linear-gradient( to bottom, #36e2ec 37%, #36e2ec 98% );
    transform-origin: bottom right;
    animation: animate 6s linear infinite;
   
}

.profile-box{

                    text-align: center;
                    /* padding: 10px 90px; */
                    
                    margin-bottom: 20px;    
                    
                    
                    height:100px;
            width: 100px;
            position: relative;
            /* top: 50%; */
            /* left: 50%; */
            /* transform: translate(-50%,-50%); */
            border-radius: 50%;
            overflow: hidden;
            border: 1px solid grey;  
                }

                .profile-pic{
                    height: 100%;
            width: 100%;

                }

                #profile{
                    display: none;

                }

                #uploadBtn{
                    height: 30px;
                    width: 100%;
                    position: absolute;
                    bottom: 0;
                    margin-bottom: 0;
                    left: 50%;
                    transform: translateX(-50%);
                    text-align: top center;
                    background: rgba(0, 0, 0, 0.7);
                    color:#fff;
                    line-height: 30px;
                    font-family: sans-serif;
                    font-size: 10px;
                    cursor: pointer;
                    display: none;
                }

.box::after{
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    
    width: 380px;
    height: 420px;
    background: white;
    transform-origin: bottom right;
    animation: animate 6s linear infinite;
    animation-delay: -3s;
}
@keyframes animate {
    0%{
        transform: rotate(0deg);
    }
    100%{
        transform: rotate(360deg);
    }
    
}
.form{
    position: absolute;
    inset: 4px;
    border-radius: 8px;
    background: linear-gradient(45deg, #111727, #131312);
    z-index: 10;
    padding: 50px 40px;
    display: flex;
    flex-direction: column
    
}
.form h2{
    color: #fff;
  
    font-weight: 500;
    text-align: center;
    letter-spacing: 0.1em;
  
}
.inputBox{
    position: relative;
    margin-top: 35px; 
    width: 300px;
   
}

.inputBox input{
    position: relative;
    width: 100%;
    padding:20px 10px 10px;
    background: transparent;
    border: none;
    outline: none;
    font-size: 1em;
    color: #36e2ec;
    letter-spacing: 0.05em;
    z-index: 10; 
}
.inputBox span{
    position: absolute;
    left: 0;
    padding-top: 40px;
    padding: 20px 0px 10px;
    font-size: 1.5em;
    color: #36e2ec;
    pointer-events: none;
    letter-spacing: 0.05em;
    transition: 0.5s;
    align-content: center;
   margin-bottom:40px;
}
.inputBox input:valid ~ span,
.inputBox input:focus ~ span{
    color: #fff;
    transform: translateX(0px) translateY(-34px);
    font-size: 0.8em;
}

.inputBox i{
    position: absolute;
    left: 0;
    bottom:  0;
    height: 2px;
    width: 100%;
    padding: 20px 10px 10px;
    font-size: 1em;
    background: #fff;
    border-radius: 4px;
    pointer-events: none;
    transition: 0.5s;
}

.inputBox input:valid ~ i,
.inputBox input:focus ~ i{
   height: 44px;
    background: #fff;
}
input[type="submit"]{
  

    text-align: center;
    border: none;
    background: #fff;
    outline: none;
    padding: 11px 25px;
    width: 150px;
    height: 40px;
    margin-top: 50px;
    border-radius: 4px;
    font-weight: 600;
    cursor: pointer;
    position: absolute;
    right: 120px; 
    
    
    
}
input[type="submit"]:active{
    opacity: 0.8;
}

    </style>
</head>
<body style="margin-top:30px;">
    <header>
        <div class="menu_side">
              <h1>TuneSpot</h1>
              <div class="playlist">
               <h4 class="active"><span></span><i class="bi bi-music-note-beamed"></i><a style="text-decoration:none;color:white;"href="index.jsp">All songs</a></h4>
                <h4><span></span><i class="bi bi-music-note-beamed"></i><a style="text-decoration:none;color:white"href="newSong.jsp">New song</a></h4>
                <h4><span></span><i class="bi bi-music-note-beamed"></i><a style="text-decoration:none;color:white"href="newArtist.jsp">Add artist</a></h4>
            </div>
                       <!--   <h3 style="margin-top:15px;margin-left:20px;">Latest songs</h3> -->
            
                          <%-- <div class="menu_song" style="margin-top:16px;">
               
                  
               
               
               
            
                  
             
                     <% for (Song songObj : (ArrayList<Song>) request.getAttribute("songs")) { %>
                        <li class="songItem">
                           <span><%= songObj.getId() %></span>
                    			<img src="image_songs/<%= songObj.getImage() %>" alt="">
                    			     <h5 class="songName">
					                      <%= songObj.getTitle() %>
					                        <div class="subtitle"><%= songObj.getTitle() %></div>
					                  </h5>
					                    <i class="bi playListPLay bi-play-circle-fill" id="<%= songObj.getId() %>"></i>
     
                        </li>
                    <% } %>
             
               
       
            </div>
             --%>
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
        User user = new User(rs3.getInt("id"),rs3.getString("nom"),rs3.getString("prenom"),rs3.getString("email"),rs3.getString("password"),rs3.getString("photo")
        		,rs3.getString("tel"),rs3.getString("adresse"));
%>

    <div class="user">
    <p> <%rs3.getString("nom"); %></p>
      <%--   <img src="image/2.jpg" alt="" title=" <%=rs3.getString("nom") %> <%=rs3.getString("prenom") %>"> --%>
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
            <div class="content" style="margin-top:-130px;margin-left:-160px;">
 

                <div class="wrapper">
      <div class="profile-top">
        <div class="profile-image"></div>
      </div>

      <div class="profile-bottom">
        <div class="profile-infos">
           
       
       <div class="container" >
		       <div class="row justify-content-center ">
		
		
			      <div class="cold-md-2 ml-6 ">
			      
                   <div class="container">
            <div class="container2">
                

                        <% 
try { 

    Connection con3 = MySQLDatabase.getConnection();
    HttpSession session2 = request.getSession(false);


    int id = (Integer) session.getAttribute("id");


    ResultSet rs3 = con3.createStatement().executeQuery("SELECT * FROM user where id= " + id);
    
    if (rs3.next()) {
%>

                <form method="POST" action="../EditUser" enctype="multipart/form-data">
                 
                    <div class="profile-box">
                        <img src="../User/images/<%=rs3.getString(6)%>" alt="" class="profile-pic">
                        <input type="file"  value="<%=rs3.getString(6)%>"name="profile" id="profile">
                        <label for="profile" id="uploadBtn">choose photo</label>
                    </div>
                     <input type="hidden"  value="<%=rs3.getString(6)%>"name="photo" id="photo">
                    
                    <div class="row">
                    <div class="t-input inline-input">  
                        <input id="nom" type="text" name="nom" value="<%=  rs3.getString(2) %>" required autofocus placeholder=".">
                        <label for="nom">Nom</label>
                        <div class="b-line"></div>
                    </div>
             		<input id="id" type="hidden" name="id" value="<%=  rs3.getInt(1) %>" required >
                        
                    <!-- Email Address -->
                    <div class="t-input inline-input">
                        <input id="prenom" type="text" name="prenom" value="<%=  rs3.getString(3) %>" required placeholder=".">
                        <label for="prenom">Prénom</label>
                        <div class="b-line"></div>
                    </div>
                    
                    </div>
                    
                    <div class="row">
                    <div class="t-input inline-input">
                        <input id="email" type="email" name="email" value="<%=  rs3.getString(4) %>" required autofocus placeholder=".">
                        <label for="email">Email</label>
                        <div class="b-line"></div>
                    </div>
                    <!-- Telephone  -->
                    <div class="t-input inline-input">
                        <input id="password" type="password" name="password" value="<%=  rs3.getString(5) %>" required placeholder=".">
                        <label for="password">Password</label>
                        <div class="b-line"></div>
                    </div>
                    </div>

                    
                    <div class="row">
                    <!-- Adresse -->
                    <div class="t-input inline-input">
                        <input id="adresse" type="text" name="adresse" value="<%=  rs3.getString(7) %>" required placeholder=".">
                        <label for="adresse">Adresse</label>
                        <div class="b-line"></div>
                    </div>
                    <!-- Ville -->
                    <div class="t-input inline-input">
                        <input id="tel" type="text" name="tel" value="<%=  rs3.getString(8) %>" required placeholder=".">
                        <label for="tel">Tel</label>
                        <div class="b-line"></div>
                    </div>
                    </div>
                        <div class="flex items-center justify-end mt-4 submit">
                            <button type="submit" class="ml-4">
                               Edit
                            </button>
                        </div>
                </form>
                            <%
    }
} catch (SQLException e) {
    e.printStackTrace();
}
%>
            </div>
        </div>
    

                </div>
                
            </div>
            </div>
     
        
    
        </div>

      </div>
    </div>
            </div>
           

          
        </div>
        <!-- <div class="master_play">
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
            <i style="margin-top:5px;" class="bi bi-volume-down-fill" id="vol_icon"></i>
            <input type="range" id="vol" min="0" max="100" value="30">
            <div class="vol_bar"></div>
            <div class="dot" id="vol_dot"></div>

               
           </div>
        </div> -->
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

    <script>
        //declearing html elements

const imgDiv = document.querySelector('.profile-box');
const img = document.querySelector('.profile-pic');
const file = document.querySelector('#profile');
const uploadBtn = document.querySelector('#uploadBtn');

//if user hover on img div 

imgDiv.addEventListener('mouseenter', function(){
    uploadBtn.style.display = "block";
});

//if we hover out from img div

imgDiv.addEventListener('mouseleave', function(){
    uploadBtn.style.display = "none";
});

//lets work for image showing functionality when we choose an image to upload

//when we choose a foto to upload

file.addEventListener('change', function(){
    //this refers to file
    const choosedFile = this.files[0];

    if (choosedFile) {

        const reader = new FileReader(); //FileReader is a predefined function of JS

        reader.addEventListener('load', function(){
            img.setAttribute('src', reader.result);
        });

        reader.readAsDataURL(choosedFile);

    }
});
    </script>
</body>
</html>
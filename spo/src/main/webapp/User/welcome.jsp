<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music Website</title>
    <link rel="stylesheet" href="./User/css/styles.css">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.js"></script>
    
</head>
<body>

    <div class="hero">
        <div class="navbar">
            <img src="./User/images/logo2.png" class="logo">
            <ul>
                <li><a href="home">HOME</a></li>
                <li><a href="Sinscrire">Inscription</a></li>
                <li><a href="login">Connexion</a></li>
              
            </ul>
        </div>
        <div class="content">
            <div class="left">
                <h1>THE <br> REAL <br> MUSIC</h1>
            </div>
            <div class="right">
                <p>Click To Play</p>
                <img src="./User/images/play.png" id="icon">
            </div>
        </div>
    </div>

    <audio id="mysong">
        <source src="./User/images/Walker.mp3" type="audio/mp3">
    </audio>
    
    <script>

        var mysong = document.getElementById("mysong");
        var icon = document.getElementById("icon");
        
        icon.onclick = function(){
            if(mysong.paused){
                mysong.play();
                icon.src = "./User/images/pause.png";
            }else{
                mysong.pause();
                icon.src = "./User/images/play.png";
            }
        }

    </script>
<!--     <script type="text/javascript">

    // ... Votre code JavaScript/jQuery ...

    // Exemple d'utilisation de SweetAlert pour afficher un message de succès
    Swal.fire("Succès", "L'action a été effectuée avec succès.", "success");
  </script> -->
  
<script type="text/javascript">
  // Récupérer le paramètre "success" de l'URL
  var successMessage = "<%= request.getParameter("success") %>";
  if (successMessage !== null && successMessage !== "" && successMessage !== "null") {
    // Utiliser SweetAlert pour afficher le message de succès
    Swal.fire("Succès", successMessage, "success");
  }
</script>


</body>
</html>
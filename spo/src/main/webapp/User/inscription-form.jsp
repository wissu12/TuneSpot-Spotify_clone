<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
   <!DOCTYPE html>
   <html lang="en">
   
   <head>
     <!-- basic -->
     <meta charset="utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <!-- mobile metas -->
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <meta name="viewport" content="initial-scale=1, maximum-scale=1">
     <!-- site metas -->
     <title>Inscription</title>
     <meta name="keywords" content="">
     <meta name="description" content="">
     <meta name="author" content="">
     <!-- fevicon -->
     <link rel="icon" href="images/fevicon.png" type="image/gif" />
     <!-- bootstrap css -->
     <link rel="stylesheet" href="./User/css/bootstrap.min.css">
     <!-- style css -->
     <link rel="stylesheet" href="./User/css/style-insc.css">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.js"></script>
     <style>
        
     </style>

   </head><!-- header inner -->
   <div class="header-top">
    <div class="header">
      <div class="container">
        <div class="row">
          <div class="col-xl-2 col-lg-2 col-md-2 col-sm-3 col logo_section">
            <div class="full">
              <div class="center-desk">
                <div class="logo">
                  <a href="index.html"><img src="./User/images/logo2.png" alt="#" /></a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-xl-10 col-lg-10 col-md-10 col-sm-9">
            
             <div class="menu-area">
              <div class="limit-box">
                <nav class="main-menu " >
                  <ul class="menu-area-main">
                     <li class="active"> <a href="home">Home</a> </li>
                
        
                    <li> <a href="Sinscrire">Inscription</a> </li>
                    <li> <a href="login">Connexion</a> </li>
    
                  
                   </ul>
                 </nav>
              
             </div> 
           </div>
         </div>
       </div>
     </div>
   </div>
   <!-- end header inner -->


<body>
    <section>
        <div class="form-box" style="height:700px;margin-top:100px;">
            <div class="form-value">
                <form action="newUser" method="POST" enctype="multipart/form-data">
                    <h2>Inscripton</h2>
                    <div class="inputbox">
                        <ion-icon name="person-outline"></ion-icon>
                        <input type="text" id="nom" name="nom" required>
                        <label for="">Nom</label>
                    </div>
                    <div class="inputbox">
                        <ion-icon name="person-outline"></ion-icon>
                        <input  type="text" id="prenom" name="prenom" required>
                        <label for="">Prénom</label>
                    </div>
                    <div class="inputbox">
                        <ion-icon name="mail-outline"></ion-icon>
                        <input type="email"id="email" name="email"  required>
                        <label for="email">Email</label>
                    </div>
                    <div class="inputbox">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                        <input type="password" id="password" name="password"  required>
                        <label for="">Mot de passe</label>
                    </div>
                     <div class="inputbox">
                        <ion-icon name="map-outline"></ion-icon>
                        <input  type="text" id="adresse" name="adresse" required>
                        <label for="">Adresse</label>
                    </div>
                     <div class="inputbox">
                        <ion-icon name="call-outline"></ion-icon>
                        <input  type="text" id="tel" name="tel" required>
                        <label for="tel">Numero de telephone</label>
                    </div>
                     <div class="inputbox">
                       <ion-icon style="margin-top:-16px;"name="person-circle-outline"></ion-icon>
			                <input type="file" id="file" name="file">
			                <label  for="file">Image</label>
			         </div>
                    
                    <button>S'inscrire</button>
                    
                </form>
            </div>
        </div>
    </section>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>

<script type="text/javascript">
  // Récupérer le paramètre "error" de l'URL
  var errorMessage = "<%= request.getParameter("error") %>";
  if (errorMessage !== null && errorMessage !== "" && errorMessage !== "null") {
    // Utiliser SweetAlert pour afficher le message d'erreur
    Swal.fire("Erreur", errorMessage, "error");
  }
</script>


</html>
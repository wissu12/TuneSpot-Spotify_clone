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
     <title>login</title>
     <meta name="keywords" content="">
     <meta name="description" content="">
     <meta name="author" content="">
     <!-- fevicon -->
     <link rel="icon" href="images/fevicon.png" type="image/gif" />
     <!-- bootstrap css -->
     <link rel="stylesheet" href="./User/css/bootstrap.min.css">
     <!-- style css -->
     <link rel="stylesheet" href="./User/css/style.css">
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
                  <a href="home"><img src="./User/images/logo2.png" alt="#" /></a>
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
        <div class="form-box">
            <div class="form-value">
                <form method="post" action="LoginServlet">
                    <h2>Connexion</h2>
                    <div class="inputbox">
                        <ion-icon name="mail-outline"></ion-icon>
                        <input type="email" name="email" required>
                        <label for="email">Email</label>
                    </div>
                    <div class="inputbox">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                        <input type="password" name="password" required>
                        <label for="password">Mot de passe</label>
                    </div>
             
                    <button>Connexion</button>
                    <div class="register">
                        <p>Vous avez pas de compte <a href="Sinscrire">Inscription</a></p>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>




</html>
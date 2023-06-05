package Visitor;



public class User {
		private int id;
	    private String nom;
	    private String prenom;
	    private String email;
	    private String password;
	    private String image;
	    private String tel;
	    private String adresse;

	    public User(int id,String nom,String prenom,String email,String password,String image,String tel,String adresse) {
			// TODO Auto-generated constructor stub
		}
	    public User(String email) {
				// TODO Auto-generated constructor stub
			}
	    public User() {
			// TODO Auto-generated constructor stub
		}
	    public User(int id,String email,String password) {
		this.id=id;
		this.email=email;
		this.password=password;
		}

		public void accept(Visitor visitor) {
	        visitor.visit(this);
	    }
	 // getters et setters

	    
	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getNom() {
	        return nom;
	    }

	    public void setNom(String nom) {
	        this.nom = nom;
	    }
	    public String getPrenom() {
	        return prenom;
	    }

	    public void setPrenom(String prenom) {
	        this.prenom = prenom;
	    }


	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }

	    public String getImage() {
	        return image;
	    }

	    public void setImage(String image) {
	        this.image = image;
	    }
	    
	    public String getAdresse() {
	        return adresse;
	    }

	    public void setAdresse(String adresse) {
	        this.adresse = adresse;
	    }
	    
	    public String getTel() {
	        return tel;
	    }

	    public void setTel(String tel) {
	        this.tel = tel;
	    }


}

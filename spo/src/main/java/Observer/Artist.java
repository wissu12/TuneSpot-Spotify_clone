
package Observer;

import java.util.ArrayList;

import java.util.List;

public class Artist implements Observable {
	private int id;
	 private String nom;
	 private String image;

    private List<Observateur> observateurs = new ArrayList<>();

    public Artist( int id,String nom, String image) {
    	this.id=id;
        this.nom = nom;
        this.image = image;

    }

    public Artist( String nom, String image) {
    
        this.nom = nom;
        this.image = image;

    }
//	public Song(int id,String title, String audioTitle, String image) {
//		
//	}

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


    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void ajouterObservateur(Observateur observateur) {
        observateurs.add(observateur);
    }

    public void supprimerObservateur(Observateur observateur) {
        observateurs.remove(observateur);
    }

    public void notifierObservateurs() {
        for (Observateur observateur : observateurs) {
            observateur.mettreAJour(this);
        }
    }

    public void ajouterChanson(Artist artist) {
        // Ajouter la chanson à la base de données
    	ArtistDAO artistDAO = new ArtistDAO();
		artistDAO.ajouterChanson(artist);

        // Notifier les observateurs
//        notifierObservateurs();
    	artistDAO.notifierUtilisateursParEmail(artist);
    }
    
}


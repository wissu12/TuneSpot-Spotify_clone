
package Observer;

import java.util.ArrayList;

import java.util.List;

public class Song implements Observable {
	private int id;
	 private String title;
	    private String audioTitle;
	    private String image;
	    private String artiste;


    private List<Observateur> observateurs = new ArrayList<>();

    public Song( int id,String title, String image,String audioTitle, String artiste) {
    	this.id=id;
        this.title = title;
      
        this.image = image;
        this.audioTitle = audioTitle;
        this.artiste = artiste;
    }
    

    public Song( int id,String title, String image,String audioTitle) {
    	this.id=id;
        this.title = title;
      
        this.image = image;
        this.audioTitle = audioTitle;
     
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
    public String getArtiste() {
        return artiste;
    }

    public void setArtiste(String artiste) {
        this.artiste = artiste;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAudioTitle() {
        return audioTitle;
    }

    public void setAudioTitle(String audioTitle) {
        this.audioTitle = audioTitle;
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

    public void ajouterChanson(Song song) {
        // Ajouter la chanson à la base de données
    	SongDAO songDAO = new SongDAO();
    	songDAO.ajouterChanson(song);

        // Notifier les observateurs
//        notifierObservateurs();
    	songDAO.notifierUtilisateursParEmail(song);
    }
    
}


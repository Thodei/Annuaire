package beans;

import java.sql.Date;

public class Personne 
{
	
	private String nom;
	private String prenom;
	private Date date_naissance;
	private String sexe;
	private String bureau;
	private Date date_arrivee;
	private String mail;
	private String avatar;
	private String poste;
	
	@Override
	public String toString()
	{
		return "Nom : " + getNom() 
		+ " | Prénom : " + getPrenom() 
		+ " | Date de naissance " + getDate_naissance() 
		+ " | Sexe : " + getSexe() 
		+ " | Bureau " + getBureau()
		+ " | Date d'arrivée : " + getDate_arrivee()
		+ " | Mail : " + getMail()
		+ " | Avatar : " + getAvatar()
		+ " | Poste : " + getPoste();
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
	public Date getDate_naissance() {
		return date_naissance;
	}
	public void setDate_naissance(Date date_naissance) {
		this.date_naissance = date_naissance;
	}
	public String getSexe() {
		return sexe;
	}
	public void setSexe(String sexe) {
		this.sexe = sexe;
	}
	public String getBureau() {
		return bureau;
	}
	public void setBureau(String bureau) {
		this.bureau = bureau;
	}
	public Date getDate_arrivee() {
		return date_arrivee;
	}
	public void setDate_arrivee(Date date_arrivee) {
		this.date_arrivee = date_arrivee;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getPoste() {
		return poste;
	}
	public void setPoste(String poste) {
		this.poste = poste;
	}
}

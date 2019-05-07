package dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import beans.Personne;

public class Requetes 
{

	public Requetes()
	{
		try 
		{
			DB_MySQL.demarrer();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	
	public static boolean est_pret()
	{
		try 
		{
			if (DB_MySQL.getConnection() != null)
				return true;
			else
				return false;
		} catch (Exception e) 
		{
			return false;
		}
	}
	
	public void login(String user, String mdp) throws Exception
	{
			Statement state = DB_MySQL.createStatement();
			ResultSet res = state.executeQuery("SELECT * FROM utilisateur WHERE login='" + user + "' AND mdp = '" + mdp + "'");
			
			if(!res.isBeforeFirst())
				throw new Exception("Nom d'utilisateur ou mot de passe incorrect");
	}
	
	public Map<String, Personne> getAllPersonne() throws Exception
	{
			Statement state = DB_MySQL.createStatement();
			ResultSet res = state.executeQuery("SELECT * FROM personne ORDER BY nom ASC");
			Map<String, Personne> personnes = new HashMap<String, Personne>();
			
			while(res.next())
			{
				int id = res.getInt(1);
				String nom = res.getString(2);
				String prenom = res.getString(3);
				Date date_naissance = res.getDate(4);
				String sexe = res.getString(5);
				String bureau = res.getString(6);
				Date date_arrivee = res.getDate(7);
				String mail = res.getString(8);
				String avatar = res.getString(9);
				int n_poste = res.getInt(10);
				
				String poste = getPosteById(n_poste);
				
				Personne p = new Personne();
				p.setNom(nom);
				p.setPrenom(prenom);
				p.setDate_naissance(date_naissance);
				p.setSexe(sexe);
				p.setBureau(bureau);
				p.setDate_arrivee(date_arrivee);
				p.setMail(mail);
				p.setAvatar(avatar);
				p.setPoste(poste);
				
				personnes.put(String.valueOf(id), p);
			}
			
			return personnes;
	}
	
	public String getPosteById(int id) throws Exception
	{
		Statement state = DB_MySQL.createStatement();
		ResultSet res = state.executeQuery("SELECT libelle FROM poste WHERE idposte='" + id + "'");
		if(res.isBeforeFirst())
		{
			res.next();
			return res.getString(1);	
		}

		return null;
	}
	
	public boolean ajouterPersonne(Personne p) throws Exception
	{
		String nom = p.getNom();
		String prenom = p.getPrenom();
		Date date_naissance = p.getDate_naissance();
		String sexe = p.getSexe();
		String bureau = p.getBureau();
		Date date_arrivee = p.getDate_arrivee();
		String mail = p.getMail();
		String avatar = p.getAvatar();
		String poste_idposte = p.getPoste();

		Statement state = DB_MySQL.createStatement();
		int etat = state.executeUpdate("INSERT INTO personne (nom, prenom, date_naissance, sexe, bureau, date_arrivee, mail, avatar, poste_idposte) "
		+ "VALUES ('"+ nom +"', '"+ prenom +"', '"+ date_naissance +"', '"+ sexe +"', '"+ bureau +"', '"+ date_arrivee +"', '"+ mail +"', '"+ avatar +"', '"+ poste_idposte +"');");
		
		if(etat > 0)
			return true;
		else
			throw new Exception("Erreur lors de l'ajout de la personne");
	}
	
	public boolean supprimerPersonne(String id) throws Exception
	{
		Statement state = DB_MySQL.createStatement();
		int etat = state.executeUpdate("DELETE FROM `personne` WHERE `personne`.`idpersonne` = " + id);
		
		if(etat > 0)
			return true;
		else
			return false;
	}
}

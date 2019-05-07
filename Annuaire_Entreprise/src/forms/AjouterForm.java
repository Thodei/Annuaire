package forms;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Personne;
import dao.Requetes;
import main.Main;
import servlet.Ajouter;

public class AjouterForm 
{
	
	private static final String CHAMP_nom = "text_nom";
	private static final String CHAMP_prenom = "text_prenom";
	private static final String CHAMP_sexe = "select_sexe";
	private static final String CHAMP_date_naissance = "date_naissance";
	private static final String CHAMP_date_arrivee = "date_arrivee";	
	private static final String CHAMP_bureau = "text_bureau";
	private static final String CHAMP_mail = "text_mail";
	private static final String CHAMP_avatar = "text_avatar";
	private static final String CHAMP_poste = "text_poste";
	
	private Map<String, String> erreurs = new HashMap<String, String>();
	
	/**
	 * Récupère les paramètres renseignés par l'utilisateur
	 * Ajoute une personne dans la BDD
	 */
	public Personne ajouter(HttpServletRequest request, HttpServletResponse response, HttpServlet servlet) throws IOException, ServletException
	{
		String nom = request.getParameter(CHAMP_nom);
		String prenom = request.getParameter(CHAMP_prenom);
		String sexe = request.getParameter(CHAMP_sexe);
		String date_naissance = request.getParameter(CHAMP_date_naissance);
		String date_arrivee = request.getParameter(CHAMP_date_arrivee);
		String bureau = request.getParameter(CHAMP_bureau);
		String mail = request.getParameter(CHAMP_mail);
		String avatar = request.getParameter(CHAMP_avatar);
		String poste = request.getParameter(CHAMP_poste);
		
		Personne p = new Personne();
		
		//On vérifie que la connexion à la BDD est bien initialisée avant de faire des requêtes
		if(!Requetes.est_pret())
        	Main.req = new Requetes();
		
		
	    try 
	    {
	        validationEmail(mail);
	    } catch ( Exception e ) 
	    {
	        setErreur(CHAMP_mail, e.getMessage());
	    }
	    p.setMail(mail);
	    
	    
	    try 
	    {
	    	verifierPoste(poste);
	    } catch (Exception e) 
	    {
	        setErreur(CHAMP_poste, e.getMessage());
	    }
	    p.setPoste(poste);
		
		p.setNom(nom);
		p.setPrenom(prenom);
		p.setSexe(sexe);
		p.setDate_naissance(Date.valueOf(date_naissance));
		p.setDate_arrivee(Date.valueOf(date_arrivee));
		p.setBureau(bureau);
		p.setAvatar(avatar);

	    if ( erreurs.isEmpty() ) 
	    {
			try 
			{
				Main.req.ajouterPersonne(p);
			} catch (Exception e) 
			{
				 setErreur("erreur", e.getMessage());
			}
			
	    	HttpSession session = request.getSession() ;
	    	session.setAttribute("etat_personne_ajoutee", true) ;
	    	response.sendRedirect("/annuaire/ajouter");
	    } else 
	    {
	    	request.setAttribute("erreurs", erreurs);
	    	request.setAttribute("etat_personne_ajoutee", false);
	    	servlet.getServletContext().getRequestDispatcher(Ajouter.VUE).forward( request, response );
	    }
		return p;
	}
	
	/**
	 * Vérifie qu'un poste existe bien
	 */
	private void verifierPoste(String poste) throws Exception
	{
		try 
		{
			if(Main.req.getPosteById(Integer.parseInt(poste)) == null)
				throw new Exception("Le poste n'existe pas");
		} catch (NumberFormatException e) 
		{
			throw new Exception("Saisissez un chiffre correspondant à un n° de poste");
		} catch (Exception e) 
		{
			throw new Exception("Le poste n'existe pas");
		}
	}
	
	/**
	 * Méthode reprise du cours d'openclassroom
	 * Permet de vérifier une adressse mail
	 */
	private void validationEmail(String email) throws Exception 
	{
	    if ( email != null ) 
	    {
	        if ( !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) 
	        {
	            throw new Exception( "Merci de saisir une adresse mail valide." );
	        }
	    } else 
	    {
	        throw new Exception( "Merci de saisir une adresse mail." );
	    }
	}
	
	private void setErreur(String champ, String message) 
	{
	    erreurs.put( champ, message );
	}
	
	public static void resetVarUtilisateur(HttpServletRequest request)
	{
    	HttpSession session = request.getSession() ;
    	session.setAttribute("etat_personne_ajoutee", false);
	}
	
	public static String getChampNom() 
	{
		return CHAMP_nom;
	}
	
	public static String getChampPrenom() 
	{
		return CHAMP_prenom;
	}
	
	public static String getChampSexe() 
	{
		return CHAMP_sexe;
	}
	
	public static String getChampDateNaissance() 
	{
		return CHAMP_date_naissance;
	}
	
	public static String getChampDateArrivee() 
	{
		return CHAMP_date_arrivee;
	}
	
	public static String getChampBureau() 
	{
		return CHAMP_bureau;
	}
	
	public static String getChampMail() 
	{
		return CHAMP_mail;
	}
	
	public static String getChampAvatar() 
	{
		return CHAMP_avatar;
	}
	
	public static String getChampPoste() 
	{
		return CHAMP_poste;
	}

}

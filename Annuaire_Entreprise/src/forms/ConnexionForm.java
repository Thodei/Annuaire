package forms;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Utilisateur;
import dao.Requetes;
import main.Main;
import servlet.Connexion;

public class ConnexionForm 
{
	private static final String CHAMP_login = "text_login";
	private static final String CHAMP_password = "text_mdp";
	private boolean erreur;
	private boolean etat_login;
	
	
	/**
	 * Récupère le login et le mdp entrés par l'utilisateur lors de la connexion et vérifie dans la BDD s'ils sont corrects
	 * Si ses identifiants sont corrects, l'utilisateur est redirigé sur la page index.jsp (/annuaire)
	 * Si ses identifiants sont incorrects, un message d'erreur s'affiche
	 */
	public Utilisateur connexion(HttpServletRequest request, HttpServletResponse response, HttpServlet servlet) throws ServletException, IOException
	{
        String login = request.getParameter("text_login");
        String pass = request.getParameter("text_mdp");
        boolean etat_login;
        
        Utilisateur user = new Utilisateur();
        user.setLogin(login);
        user.setPassword(pass);
        
        //On vérifie si une instance de Requetes a déjà été créé, sinon on en créé une
        if(!Requetes.est_pret())
        	Main.req = new Requetes();

        try 
        {
        	Main.req.login(login, pass);
        	etat_login = true;
        } catch (Exception e) 
        {
            etat_login = false;
        }
        
        if(!etat_login)
        {
        	request.setAttribute("etat_login", false);
        	request.setAttribute("erreur", true);
        	servlet.getServletContext().getRequestDispatcher( Connexion.VUE ).forward(request, response);
        }
        else
        {
        	HttpSession session = request.getSession() ;
        	session.setAttribute("etat_login", true) ;
        	response.sendRedirect("/annuaire/annuaire");
        }
        
        return user;
	}
	
	public boolean isErreur() 
	{
		return erreur;
	}
	
	public void setErreur(boolean erreur) 
	{
		this.erreur = erreur;
	}
	
	public boolean isEtat_login() 
	{
		return etat_login;
	}
	
	public void setEtat_login(boolean etat_login) 
	{
		this.etat_login = etat_login;
	}
	
	public static String getChampLogin() 
	{
		return CHAMP_login;
	}
	
	public static String getChampPassword() 
	{
		return CHAMP_password;
	}
}

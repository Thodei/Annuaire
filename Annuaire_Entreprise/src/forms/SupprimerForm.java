package forms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Requetes;
import main.Main;

public class SupprimerForm 
{
	private static final String CHAMP_n_identification = "text_n_identification";
	private boolean etat_suppression;
	private String erreur;
	
	public void supprimer(HttpServletRequest request, HttpServletResponse response) 
	{
		String n_identification = request.getParameter(CHAMP_n_identification);
		
		if(!Requetes.est_pret())
        	Main.req = new Requetes();
		
		try 
		{
			if(Main.req.supprimerPersonne(n_identification))
				setEtat_suppression(true);
			else
			{
				setEtat_suppression(false);
				setErreur("Cette personne n'existe pas");
			}
			
		} catch (Exception e) 
		{
			setEtat_suppression(false);
			setErreur(e.getMessage());
		}
		setEtat_suppression(false);
	}
	
	public boolean isEtat_suppression() {
		return etat_suppression;
	}

	public void setEtat_suppression(boolean etat_suppression) {
		this.etat_suppression = etat_suppression;
	}

	public String getErreur() {
		return erreur;
	}

	public void setErreur(String erreur) {
		this.erreur = erreur;
	}

}

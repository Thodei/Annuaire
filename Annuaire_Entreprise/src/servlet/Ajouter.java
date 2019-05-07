package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Personne;
import forms.AjouterForm;

public class Ajouter extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    public static final String VUE = "/WEB-INF/ajouter.jsp";

	@Override
	  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	  {
	    this.getServletContext().getRequestDispatcher(VUE).forward( request, response );
	  }

	  @Override
	  public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	  {
		  
	    AjouterForm f = new AjouterForm();
	    Personne p = f.ajouter(request, response, this);
	    
	    //On envoie la personne ajoutée à la vue au cas où elle doit être traitée
	    if(p != null)
	    	request.setAttribute("personne_ajoutee", p);
	  }
}

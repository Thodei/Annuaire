package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Personne;
import dao.Requetes;
import forms.AjouterForm;
import main.Main;

public class Annuaire extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public static final String VUE = "/WEB-INF/index.jsp";
	private Map<String, Personne> personnes;
	
	  @Override
	  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	  {
	    response.setContentType("text/html");
	    AjouterForm.resetVarUtilisateur(request);
		try 
		{
	        if(!Requetes.est_pret())
	        	Main.req = new Requetes();
	        
			personnes = Main.req.getAllPersonne();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		request.setAttribute("personnes", personnes);

	    this.getServletContext().getRequestDispatcher(VUE).forward( request, response );
	  }

	  @Override
	  public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	  {
	    doGet(request, response);
	  }

}

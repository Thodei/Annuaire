package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Personne;
import forms.AjouterForm;
import forms.SupprimerForm;

public class Supprimer extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    public static final String VUE = "/WEB-INF/supprimer.jsp";

	@Override
	  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	  {
	    this.getServletContext().getRequestDispatcher(VUE).forward( request, response );
	  }

	  @Override
	  public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	  {
		  SupprimerForm form = new SupprimerForm();
		  form.supprimer(request, response);
		  request.setAttribute("form", form);
		  this.getServletContext().getRequestDispatcher(VUE).forward( request, response );
	  }
}

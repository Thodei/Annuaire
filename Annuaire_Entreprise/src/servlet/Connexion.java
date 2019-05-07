package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Utilisateur;
import dao.Requetes;
import forms.ConnexionForm;
import main.Main;

public class Connexion  extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    public static final String VUE = "/WEB-INF/connexion.jsp";

	@Override
	  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	  {
	    response.setContentType("text/html");

	    this.getServletContext().getRequestDispatcher(VUE).forward( request, response );
	  }

	  @Override
	  public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	  {
	    ConnexionForm form = new ConnexionForm(); 
	    Utilisateur utilisateur = form.connexion(request, response, this);
      	HttpSession session = request.getSession();
      	session.setAttribute("user", utilisateur) ;
	  }
}

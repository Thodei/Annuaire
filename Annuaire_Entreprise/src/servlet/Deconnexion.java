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
import forms.ConnexionForm;

public class Deconnexion  extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    public static final String VUE = "/WEB-INF/deconnexion.jsp";

	@Override
	  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	  {
	    response.setContentType("text/html");
	    request.getSession().invalidate();
	    this.getServletContext().getRequestDispatcher(VUE).forward( request, response );
	  }
}

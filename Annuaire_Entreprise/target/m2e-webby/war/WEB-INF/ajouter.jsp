<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Annuaire - Ajouter</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  
  <style>
    .erreur{color:red;}    
    body{background-color:rgb(250,250,250);}
  </style>
</head>

<body>
  <%@ include file="verification_login.jsp" %>
  <%@ include file="navbar.jsp" %>
  
  <div class="row mt-5 ml-5" style="position:absolute">
  <div class="col-2">
	  <a href="annuaire">
	  	<input type="button" value="Retour" class="btn btn-primary"/>
	  </a>
  </div>
  <div class="col-10"></div>
  </div>
  
  
  <div class="container my-5" style="background-color:rgb(240,240,240);padding:25px">
    <form method="post" action="ajouter">
    <div class="row mb-4">
	    <div class="col-12 text-center">
	    	<h1>Formulaire d'ajout de personne</h1>
	    </div>
    </div>
      
      <div class="row">
        <div class="col">
          <input type="text" id="text_nom" name="text_nom" class="form-control my-2" placeholder="Nom" style="width:250px" required />
          <input type="text" id="text_prenom" name="text_prenom" class="form-control my-2" placeholder="Prénom" style="width:250px" required />
          
          <label for="select_sexe">Sexe</label>
          <select class="form-control mb-2" id="select_sexe" name="select_sexe" style="width:250px" required>
            <option>Homme</option>
            <option>Femme</option>
            <option>Autre</option>
          </select>
        </div>
        
        <div class="col">
          <label for="date_naissance">Date de naissance</label>
          <input id="date_naissance" name="date_naissance" type="date" class="form-control mb-2" placeholder="Date de naissance" style="width:250px" required />
          <label for="date_naissance">Date d'arrivée</label>
          <input id="date_arrivee" name="date_arrivee" type="date" class="form-control mb-2" placeholder="Date d'arrivée" style="width:250px" required />
        </div>
        
        <div class="col">
          <input id="text_bureau" name="text_bureau" type="text" class="form-control my-2" placeholder="Bureau" style="width:250px" required />
          <input id="text_mail" name="text_mail" type="text" class="form-control my-2" placeholder="Mail" style="width:250px" required />
          <small class="erreur">${erreurs['text_mail']}</small>
          <input id="text_avatar" name="text_avatar" type="text" class="form-control my-2" placeholder="Avatar" style="width:250px" required />
          <input id="text_poste" name="text_poste" type="text" class="form-control mt-2" placeholder="Poste*" style="width:250px" onblur="this.value=this.value.replace(/\D/g,'')" required />
          <small>(*Chiffres uniquement)</small>
         <small class="erreur">${erreurs['text_poste']}</small>
        </div>
      </div>
      
      <div class="row">
	    <div class="col-12 text-center">
	    	<input type="submit" class="btn btn-primary"/>
	    </div>
      </div>
          
    </form>
  </div>
        <c:if test="${etat_personne_ajoutee}">
			<div class="alert alert-primary mx-auto mt-1" role="alert" style="width:500px;" >
	  			Personne ajoutée !
 		 	</div>
  		</c:if>
  
  <%@ include file="footer.jsp" %>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>

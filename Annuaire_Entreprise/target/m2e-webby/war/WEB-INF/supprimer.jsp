<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Annuaire - Supprimer</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  
  <style>
    body{background-color:rgb(250,250,250);}
    .erreur{color:red;}
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
    <form method="post" action="supprimer">
      <div class="row mb-4">
        <div class="col-12 text-center">
          <h1>Supprimer une personne</h1>
        </div>
      </div>
      
      <div class="row">
        <div class="col-5"></div>
        <div class="col-2 d-flex justify-content-center">
          <input id="text_n_identification" name="text_n_identification" class="form-control mb-1" type="text" placeholder="N° d'itentification (#)" style="width:350px"/>
        </div>
        <div class="col-5"></div>
      </div>
      
      <div class="row">
        <div class="col-12 text-center">
          <input type="submit" class="btn btn-danger mx-auto" value="Supprimer"/>
        </div>
      </div>
      
    </form>
  </div>
  
  <c:if test="${form.etat_suppression}">
  	<div class="alert alert-primary mx-auto mt-1" role="alert" style="width:500px;" >
   	 Utilisateur supprimé !
  	</div>
  </c:if>

  <c:if test="${form.erreur != null}">
	<div class="alert alert-danger mx-auto mt-1" role="alert" style="width:500px;" >
 		 ${form.erreur}
	</div>
  </c:if>

<%@ include file="footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>

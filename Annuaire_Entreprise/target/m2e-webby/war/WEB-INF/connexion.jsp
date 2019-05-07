<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Annuaire - Connexion</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <style>
    body{ background-color:rgb(250,250,250);}
  </style>
</head>

<body>
  <c:if test="${etat_login}">
  <c:redirect url="/annuaire"/>
</c:if>

<%@ include file="navbar.jsp" %>

<form id="form_connexion" method="post" action="connexion" class="mx-auto my-5 needs-validation" style="width:500px; padding:25px;background-color:rgb(240,240,240); border-radius:2%">
  <h2 class="text-center">Connexion</h2>
  <div class="form-group">
    <label for="text_login">Identifiant</label>
    <input type="text" class="form-control" id="text_login" name="text_login" aria-describedby="aide identifiant" placeholder="Entrez un identifiant ..." value="<c:out value="${param.text_login}"/>" style="width:250px" required>
  </div>
  <div class="form-group">
    <label for="text_mdp">Mot de passe </label>
    <input type="password" class="form-control" id="text_mdp" name="text_mdp" placeholder="Entrez un mot de passe ..." style="width:250px" required>
  </div>
  <c:if test="${ erreur }">
  <div class="alert alert-danger" role="alert">
    Nom d'utilisateur ou mot de passe incorrect
  </div>
</c:if>

<button type="submit" class="btn btn-primary">Connexion</button>
</form>

<%@ include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>

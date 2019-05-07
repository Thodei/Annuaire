<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
      <title>Annuaire - Deconnexion</title>
  </head>

  <body>
   	<h1>Deconnexion en cours ... Si vous n'êtes pas redirigé, cliquez sur <a href="connexion" >ce lien</a></h1>
   	<c:redirect url="/connexion"/>
  		<c:if test="${!etat_login}">
		<c:redirect url="/connexion"/>
	</c:if>
   </body>
</html>

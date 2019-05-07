      <nav class="navbar navbar-light bg-light">
        <a class="navbar-brand" href="annuaire">
          Annuaire
        </a>
        <c:if test="${ etat_login }">
          <form class="form-inline">
          <span class="mx-5">
          		Connecté en tant que : 
          		<b>
		  			<c:out value = "${user.getLogin()}"/>
		  		</b>
		  </span>
          <a href="deconnexion">
          	<button class="btn btn-sm btn-danger" type="button">Déconnexion</button>
          </a>
		  </form>
		</c:if>
      </nav>
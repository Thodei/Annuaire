<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
      <title>Annuaire - Index</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <style>
        body{background-color:rgb(250,250,250);}
        </style>
    </head>

    <body>
	<%@ include file="verification_login.jsp" %>
	<%@ include file="navbar.jsp" %>

	<input type="search" id="recherche" class="form-control mx-auto mt-5" onkeyup="chercher()" placeholder="Recherchez quelqu'un ..." style="width:250px; padding:25px"/>
	
	<div class="row mt-2" style="width:100%">
		<div class="col-4"></div>
		<div class="col-4 d-flex justify-content-center">
		    <a href="ajouter">         
				<input type="button" class="btn btn-primary mx-auto ml-1" value="Ajouter un utilisateur" />
			</a>
			
			<a href="supprimer"> 
				<input type="button" class="btn btn-danger mx-auto mr-1" value="Supprimer un utilisateur" />
			</a>
		</div>
		<div class="col-4"></div>
	</div>	

	<%@ include file="tableau.jsp" %>
	<%@ include file="footer.jsp" %>
	
	<script>
	function chercher() 
	{
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("recherche");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("tableau");
	  tr = table.getElementsByTagName("tr");
	
	  for (i = 1; i < tr.length+1; i++)
	  {
	    td = tr[i];
	    if (td) 
	    {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) 
	      {
	        tr[i].style.display = "";
	      } else 
	      {
	        tr[i].style.display = "none";
	      }
	    }
	  }
	}
	</script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
      </body>
    </html>
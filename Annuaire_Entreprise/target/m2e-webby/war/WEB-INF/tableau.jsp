<div style="width:90%" class="mx-auto my-5">
<table id="tableau"class="table table-sm table-striped">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Avatar</th>
      <th scope="col">Nom</th>
      <th scope="col">Prénom</th>
      <th scope="col">Sexe</th>
      <th scope="col">Date de naissance</th>
      <th scope="col">Mail</th>
      <th scope="col">Poste occupé</th>
      <th scope="col">Bureau</th>
      <th scope="col">Date d'arrivée</th>
    </tr>
  </thead>
  <tbody>    
     <c:forEach items="${personnes}" var="p">
     <tr>
      <td scope="row"><a href="#" class="badge badge-dark">${p.key}</a></td>
      <td>${p.value.avatar }</td>
      <td>${p.value.nom }</td>
      <td>${p.value.prenom }</td>
      <td>${p.value.sexe }</td>
      <td>${p.value.date_naissance }</td>
      <td><a href="mailto:${p.value.mail }">${p.value.mail }</a></td>
      <td>${p.value.poste }</td>
      <td>${p.value.bureau }</td>
      <td>${p.value.date_arrivee }</td>
      </tr>
     </c:forEach>
  </tbody>
</table>
</div>
<%@page import="it.gestioneordinejspservletjpamaven.model.Ordine"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../header.jsp" />
	<title>Aggiorna Ordine</title>
	
	<!-- style per le pagine diverse dalla index -->
    <link href="./assets/css/global.css" rel="stylesheet">
    
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	
	<main role="main" class="container">
	
		<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
		  ${errorMessage}
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<% Ordine ordineDaModificare = (Ordine)request.getAttribute("ordineDaModificare"); %>
		
		<div class='card'>
		    <div class='card-header' style="background:#9AF676;">
		        <h5 >Aggiorna ordine</h5> 
		    </div>
		    <div class='card-body'>
		    	<form method="post" action="ExecuteUpdateOrdineServlet">
  					<div class="form-row">
    					 <div class="form-group col-md-6">
     						<label for="codice">Codice:</label>
      						<input type="text" class="form-control" id="codice" name="codice" placeholder="Codice" value="<%=ordineDaModificare.getCodice() %>" required>
    					</div>
    					    <div class="form-group col-md-6">
     						<label for="descrizione">Descrizione</label>
      						<input type="text" class="form-control" id="descrizione" name="descrizione" placeholder="Descrizione" value="<%=ordineDaModificare.getDescrizione() %>" required>
    					</div>
  					</div>
  					<div class="form-row">
   						  <div class="form-group col-md-6">
     						<label for="prezzo">Prezzo</label>
      						<input type="number" min="0" class="form-control" id="prezzo" name="prezzo" placeholder="Prezzo" value="<%=ordineDaModificare.getPrezzo() %>" required>
    					</div>
    					    <div class="form-group col-md-6">
      						<label for="email">Email da contattare</label>
      						<div class="input-group">
        						<div class="input-group-prepend">
         							 <span class="input-group-text" id="inputGroupPrepend3">@</span>
        						</div>
        						<input type="email" class="form-control" id="email" placeholder="Email" name= "email" aria-describedby="inputGroupPrepend3" value="<%=ordineDaModificare.getEmail() %>" required>
      						</div>
    					</div>
  				</div>
  				<input type="hidden" name= "idOrdine" value="<%=ordineDaModificare.getId()%>">
		        <a href="ListOrdiniServlet" class='btn btn-outline-secondary' style='width:100px'>
		            <i class='fa fa-chevron-left'></i> Indietro
		        </a>
		        <button class = "btn" style="color:black;background:#9AF676; width:100px; float:right;" type="submit">Aggiorna</button>
		</form>
		    	
		    
			<!-- end card-body -->			   
		    </div>
		</div>	
	
	<!-- end container -->	
	</main>
	<jsp:include page="../footer.jsp" />
	
<script type="text/javascript">


</script>
	
</body>
</html>
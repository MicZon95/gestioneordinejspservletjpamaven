<%@page import="it.gestioneordinejspservletjpamaven.model.Ordine"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../header.jsp" />
	<title>Visualizza elemento</title>
	
	<!-- style per le pagine diverse dalla index -->
    <link href="./assets/css/global.css" rel="stylesheet">
    
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	
	<main role="main" class="container">
		
		<div class='card'>
		    <div class='card-header' style="background: #8CF5CE">
		        Visualizza dettaglio ordine
		    </div>
		    <% Ordine ordineDettaglio = (Ordine)request.getAttribute("ordineDettaglio"); %>
		
		    <div class='card-body'>
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Codice</dt>
				  <dd class="col-sm-9"><%=ordineDettaglio.getCodice() %></dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Descrizione:</dt>
				  <dd class="col-sm-9"><%=ordineDettaglio.getDescrizione() %></dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Prezzo:</dt>
				  <dd class="col-sm-9"><%=ordineDettaglio.getPrezzo() %></dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Email di contatto:</dt>
				  <dd class="col-sm-9"><%=ordineDettaglio.getEmail() %></dd>
		    	</dl>
		    	
		    </div>
		    
		    <div class='card-footer'>
		        <a href="ListOrdiniServlet" class='btn btn-outline-secondary' style='width:100px'>
		            <i class='fa fa-chevron-left'></i> Indietro
		        </a>
		    </div>
		</div>	
	
	
	
	<!-- end main container -->	
	</main>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>
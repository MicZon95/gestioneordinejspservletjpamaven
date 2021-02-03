<%@page import="it.gestioneordinejspservletjpamaven.model.Ordine"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../header.jsp" />
	<title>Elimina Ordine</title>
	
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
		<% Ordine ordineDaCancellare = (Ordine)request.getAttribute("ordineDaCancellare"); %>
		<div class='card'>
		    <div class='card-header' style="background: #e53935;">
		        Elimina ordine
		    </div>
		<div class='card-body'>
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Codice</dt>
				  <dd class="col-sm-9"><%=ordineDaCancellare.getCodice() %></dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Descrizione:</dt>
				  <dd class="col-sm-9"><%=ordineDaCancellare.getDescrizione() %></dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Prezzo:</dt>
				  <dd class="col-sm-9"><%=ordineDaCancellare.getPrezzo() %></dd>
		    	</dl>
		    	
		    	<dl class="row">
				  <dt class="col-sm-3 text-right">Email di contatto:</dt>
				  <dd class="col-sm-9"><%=ordineDaCancellare.getEmail() %></dd>
		    	</dl>
		    	
		    </div>
		    
		    <div class='card-footer'>
		        <a href="ListOrdiniServlet" class='btn btn-outline-secondary' style='width:100px'>
		            <i class='fa fa-chevron-left'></i> Indietro
		        </a>
		        <a href="ExecuteDeleteOrdineServlet?idOrdine=<%= ordineDaCancellare.getId() %>" class='btn btn-outline-danger' style='width:100px; float:right;'>
		            <i class='fa fa-chevron-right'></i> Cancella
		        </a>
		    </div>
		    </div>
	
	<!-- end main container -->	
	</main>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>
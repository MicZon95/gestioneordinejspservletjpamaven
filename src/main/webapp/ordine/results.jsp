<%@page import="it.gestioneordinejspservletjpamaven.model.Ordine"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../header.jsp" />
	<title>Pagina dei risultati</title>
	
	<!-- style per le pagine diverse dalla index -->
    <link href="./assets/css/global.css" rel="stylesheet">
    
</head>
<body>
	<jsp:include page="../navbar.jsp" />
	
	<main role="main" class="container">
	
		<div class="alert alert-success alert-dismissible fade show ${successMessage==null?'d-none': ''}" role="alert">
		  ${successMessage}
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		
		<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none': ''}" role="alert">
		  ${errorMessage}
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		
		<!---------------------------------->
		<!-- ESEMPI DI ALERT DI BOOTSTRAP -->
		<div class="alert alert-danger alert-dismissible fade show d-none" role="alert">
		  Esempio di operazione fallita!
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<div class="alert alert-info alert-dismissible fade show d-none" role="alert">
		  Aggiungere d-none nelle class per non far apparire
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<!--------   end  ------------------>
		<!---------------------------------->
		
		<div class='card'>
		    <div class='card-header'>
		        <h5>Lista dei risultati</h5> 
		    </div>
		    <div class='card-body'>
		    	<a class="btn btn-primary " href="PrepareInsertOrdineServlet">Aggiungi un nuovo ordine</a>
		    
		        <div class='table-responsive'>
		            <table class='table table-striped ' >
		                <thead>
		                    <tr>
		                        <th>Codice</th>
		                        <th>Descrizione</th>
		                        <th>Prezzo</th>
		                        <th>Email per comunicazioni</th>
		                        <th>Azioni</th>
		                    </tr>
		                </thead>
		                <tbody>
		                	<% List<Ordine> listaOrdini = (List<Ordine>)request.getAttribute("listaOrdini");
		                		for(Ordine item:listaOrdini){ %>
		                    <tr >
		                        <td><%=item.getCodice() %></td>
		                        <td><%=item.getDescrizione() %></td>
		                        <td><%=item.getPrezzo() %></td>
		                        <td><%=item.getEmail()%></td>
		                        <td>
									<a class="btn  btn-sm btn-outline-secondary" href="ExecuteDettaglioOrdineServlet?idOrdine=<%=item.getId() %>">Dettaglio</a>
									<a class="btn  btn-sm btn-outline-primary ml-2 mr-2" href="PrepareUpdateOrdineServlet?idOrdine=<%=item.getId() %>">Modifica</a>
									<a class="btn btn-outline-danger btn-sm" href="PrepareDeleteOrdineServlet?idOrdine=<%=item.getId() %>">Cancella</a>
								</td>
		                    </tr>
		                    <% } %>
		                </tbody>
		            </table>
		        </div>
		   
			<!-- end card-body -->			   
		    </div>
		</div>	
	
	
	
	<!-- end container -->	
	</main>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>
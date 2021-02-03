<!doctype html>
<html lang="it">
<head>
	<jsp:include page="../header.jsp" />
	<title>Inserisci nuovo</title>
	
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
		
		<div class='card'>
		    <div class='card-header' style="background:#428bca;">
		        <h5 >Inserisci un nuovo ordine</h5> 
		    </div>
		    <div class='card-body'>
		    	<form method="post" action="ExecuteInsertOrdineServlet">
  					<div class="form-row">
    					 <div class="form-group col-md-6">
     						<label for="codice">Codice:</label>
      						<input type="text" class="form-control" id="codice" name="codice" placeholder="Codice" required>
    					</div>
    					    <div class="form-group col-md-6">
     						<label for="descrizione">Descrizione</label>
      						<input type="text" class="form-control" id="descrizione" name="descrizione" placeholder="Descrizione" required>
    					</div>
  					</div>
  					<div class="form-row">
   						  <div class="form-group col-md-6">
     						<label for="prezzo">Prezzo</label>
      						<input type="number" min="0" class="form-control" id="prezzo" name="prezzo" placeholder="Prezzo" required>
    					</div>
    					    <div class="form-group col-md-6">
      						<label for="email">Email da contattare</label>
      						<div class="input-group">
        						<div class="input-group-prepend">
         							 <span class="input-group-text" id="inputGroupPrepend3">@</span>
        						</div>
        						<input type="email" class="form-control" id="email" placeholder="Email" name= "email" aria-describedby="inputGroupPrepend3" required>
      						</div>
    					</div>
  				</div>
  				<button class = "btn" style="color:black;background:#428bca;" type="submit">Inserisci</button>
		</form>
		    	
		    
			<!-- end card-body -->			   
		    </div>
		</div>	
	
	
	<!-- end container -->	
	</main>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>
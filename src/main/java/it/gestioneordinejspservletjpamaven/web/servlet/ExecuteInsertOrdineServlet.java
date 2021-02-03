package it.gestioneordinejspservletjpamaven.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gestioneordinejspservletjpamaven.model.Ordine;
import it.gestioneordinejspservletjpamaven.service.MyServiceFactory;
import it.gestioneordinejspservletjpamaven.utility.OrdineUtility;

@WebServlet("/ExecuteInsertOrdineServlet")
public class ExecuteInsertOrdineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExecuteInsertOrdineServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String codice = request.getParameter("codice");
		String descrizione = request.getParameter("descrizione");
		String prezzo = request.getParameter("prezzo");
		String email = request.getParameter("email");
		
		if(!OrdineUtility.validateInput(codice, descrizione, prezzo, email)) {
			request.setAttribute("errorMessage", "Errore di validazione");
			request.getRequestDispatcher("ordine/insert.jsp").forward(request, response);
			return;
		}
		
		Ordine ordineInsert = new Ordine(codice, descrizione, Integer.parseInt(prezzo), email);
		
		try {
			MyServiceFactory.getOrdineServiceInstance().inserisciNuovo(ordineInsert);
			request.setAttribute("succesMessage", "Ordine Inserito");
			request.setAttribute("listaOrdini", MyServiceFactory.getOrdineServiceInstance().listAll());
			request.getRequestDispatcher("ordine/results.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Si è verificato un errore");
			request.getRequestDispatcher("ordine/insert.jsp").forward(request, response);
			return;
		}
	}

}

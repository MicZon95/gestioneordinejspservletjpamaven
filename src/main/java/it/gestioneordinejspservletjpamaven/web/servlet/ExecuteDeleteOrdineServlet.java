package it.gestioneordinejspservletjpamaven.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gestioneordinejspservletjpamaven.model.Ordine;
import it.gestioneordinejspservletjpamaven.service.MyServiceFactory;
import it.gestioneordinejspservletjpamaven.service.OrdineService;


@WebServlet("/ExecuteDeleteOrdineServlet")
public class ExecuteDeleteOrdineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ExecuteDeleteOrdineServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Long idOrdine = Long.parseLong(request.getParameter("idOrdine"));
			OrdineService ordineSevice = MyServiceFactory.getOrdineServiceInstance();
			Ordine ordine = ordineSevice.caricaSingoloElemento(idOrdine);
			ordineSevice.rimuovi(ordine);
			request.setAttribute("listaOrdini", MyServiceFactory.getOrdineServiceInstance().listAll());
			request.setAttribute("successMessage", "Eliminazione effettuata con successo");
			request.getRequestDispatcher("/ordine/results.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore durante l'eliminazione");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

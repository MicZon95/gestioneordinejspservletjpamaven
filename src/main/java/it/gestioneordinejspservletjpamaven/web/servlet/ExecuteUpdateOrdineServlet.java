package it.gestioneordinejspservletjpamaven.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.gestioneordinejspservletjpamaven.model.Ordine;
import it.gestioneordinejspservletjpamaven.service.MyServiceFactory;
import it.gestioneordinejspservletjpamaven.utility.OrdineUtility;


@WebServlet("/ExecuteUpdateOrdineServlet")
public class ExecuteUpdateOrdineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExecuteUpdateOrdineServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codice = request.getParameter("codice");
		String descrizione = request.getParameter("descrizione");
		String prezzo = request.getParameter("prezzo");
		String email = request.getParameter("email");
		String idOrdine = request.getParameter("idOrdine");
		
		try {
			
			if(!NumberUtils.isCreatable(idOrdine)) {
				request.setAttribute("errorMessage", "Si è verificato un errore");
				request.setAttribute("listaOrdini", MyServiceFactory.getOrdineServiceInstance().listAll());
				request.getRequestDispatcher("ordine/results.jsp").forward(request, response);
				return;
			}
			
			Ordine ordineDaModificare = MyServiceFactory.getOrdineServiceInstance().caricaSingoloElemento(Long.parseLong(idOrdine));
			
			if (!OrdineUtility.validateInput(codice, descrizione, prezzo, email)) {
				request.setAttribute("errorMessage", "Attenzione sono presenti errori di validazione");
				request.setAttribute("ordineDaModificare", ordineDaModificare);
				request.getRequestDispatcher("ordine/update.jsp").forward(request, response);
				return;
			}
			ordineDaModificare.setCodice(codice);
			ordineDaModificare.setEmail(email);
			ordineDaModificare.setDescrizione(descrizione);
			ordineDaModificare.setPrezzo(Integer.parseInt(prezzo));
			MyServiceFactory.getOrdineServiceInstance().aggiorna(ordineDaModificare);
			request.setAttribute("listaOrdini", MyServiceFactory.getOrdineServiceInstance().listAll());
			request.setAttribute("successMessage", "Aggiornamento effettuato con successo");
			request.getRequestDispatcher("ordine/results.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
	}

}

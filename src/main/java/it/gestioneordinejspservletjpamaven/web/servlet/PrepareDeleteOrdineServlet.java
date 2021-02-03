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


@WebServlet("/PrepareDeleteOrdineServlet")
public class PrepareDeleteOrdineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public PrepareDeleteOrdineServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idOrdine = request.getParameter("idOrdine");
		
		if(!NumberUtils.isCreatable(idOrdine)) {
			request.setAttribute("errorMessage", "Si è verificato un errore");
			request.getRequestDispatcher("ordine/results.jsp").forward(request, response);
			return;
		}
		
		try {
			Ordine ordineDaCancellare = MyServiceFactory.getOrdineServiceInstance().caricaSingoloElemento(Long.parseLong(idOrdine));
			request.setAttribute("ordineDaCancellare", ordineDaCancellare);
			request.getRequestDispatcher("ordine/delete.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Si è verificato un errore nella visualizzazione della pagina di cancellazione");
			request.getRequestDispatcher("ordine/results.jsp").forward(request, response);
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

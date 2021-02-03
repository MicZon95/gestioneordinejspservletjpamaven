package it.gestioneordinejspservletjpamaven.service;

import it.gestioneordinejspservletjpamaven.dao.OrdineDAO;
import it.gestioneordinejspservletjpamaven.dao.OrdineDAOImpl;

public class MyServiceFactory {

	// implementiamo il singleton in modo da evitare
	// proliferazione di riferimenti
	private static OrdineService ORDINE_SERVICE_INSTANCE = null;
	private static OrdineDAO ORDINE_DAO_INSTANCE = null;

	public static OrdineService getOrdineServiceInstance() {
		if (ORDINE_SERVICE_INSTANCE == null)
			ORDINE_SERVICE_INSTANCE = new OrdineServiceImpl();

		if (ORDINE_DAO_INSTANCE == null)
			ORDINE_DAO_INSTANCE = new OrdineDAOImpl();

		ORDINE_SERVICE_INSTANCE.setOrdineDao(ORDINE_DAO_INSTANCE);

		return ORDINE_SERVICE_INSTANCE;
	}

}

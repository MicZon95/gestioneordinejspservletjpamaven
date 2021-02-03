package it.gestioneordinejspservletjpamaven.dao;

public class MyDaoFactory {

	private static OrdineDAO ordineDaoInstance = null;

	public static OrdineDAO getOrdineDAOInstance() {
		if (ordineDaoInstance == null)
			ordineDaoInstance = new OrdineDAOImpl();

		return ordineDaoInstance;
	}

}

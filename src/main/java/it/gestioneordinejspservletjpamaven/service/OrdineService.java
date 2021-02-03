package it.gestioneordinejspservletjpamaven.service;

import java.util.List;

import it.gestioneordinejspservletjpamaven.dao.OrdineDAO;
import it.gestioneordinejspservletjpamaven.model.Ordine;

public interface OrdineService {
	
	public void setOrdineDao(OrdineDAO ordineDao);

	public List<Ordine> listAll() throws Exception;

	public Ordine caricaSingoloElemento(Long idInput) throws Exception;

	public void aggiorna(Ordine input) throws Exception;

	public void inserisciNuovo(Ordine input) throws Exception;

	public void rimuovi(Ordine input) throws Exception;

}

package it.gestioneordinejspservletjpamaven.utility;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

public class OrdineUtility {
	
	public static boolean validateInput(String codiceInput, String descrizioneInput, String prezzoInputString,
			String emailInput) {
		// prima controlliamo che non siano vuoti
		if (StringUtils.isBlank(codiceInput) || StringUtils.isBlank(descrizioneInput)
				|| !NumberUtils.isCreatable(prezzoInputString) || StringUtils.isBlank(emailInput)) {
			return false;
		}
		return true;
	}
}

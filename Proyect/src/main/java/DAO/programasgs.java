package DAO;

public class programasgs {
	
	private String codigoprograma; 
	private String nombreprograma;
	private String duracionetapalectiva;
	private String duracionetapaproductiva;
	private String creditos;
	private String horas;
	
	public programasgs(String codigoprograma, String nombreprograma, String duracionetapalectiva,
			String duracionetapaproductiva, String creditos, String horas) {
		super();
		this.codigoprograma = codigoprograma;
		this.nombreprograma = nombreprograma;
		this.duracionetapalectiva = duracionetapalectiva;
		this.duracionetapaproductiva = duracionetapaproductiva;
		this.creditos = creditos;
		this.horas = horas;
	}
	
	public programasgs() {
		super();
	}

	public String getCodigoprograma() {
		return codigoprograma;
	}

	public void setCodigoprograma(String codigoprograma) {
		this.codigoprograma = codigoprograma;
	}

	public String getNombreprograma() {
		return nombreprograma;
	}

	public void setNombreprograma(String nombreprograma) {
		this.nombreprograma = nombreprograma;
	}

	public String getDuracionetapalectiva() {
		return duracionetapalectiva;
	}

	public void setDuracionetapalectiva(String duracionetapalectiva) {
		this.duracionetapalectiva = duracionetapalectiva;
	}

	public String getDuracionetapaproductiva() {
		return duracionetapaproductiva;
	}

	public void setDuracionetapaproductiva(String duracionetapaproductiva) {
		this.duracionetapaproductiva = duracionetapaproductiva;
	}

	public String getCreditos() {
		return creditos;
	}

	public void setCreditos(String creditos) {
		this.creditos = creditos;
	}

	public String getHoras() {
		return horas;
	}

	public void setHoras(String horas) {
		this.horas = horas;
	}
	

	
	

}

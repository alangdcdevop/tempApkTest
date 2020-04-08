package packages.stepdefinitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Steps;
import packages.pageObject.Contacts;
import packages.pageObject.Home;
import packages.pageObject.TransferPage;

public class TransferSteps {

    @Steps
    private Home home;

    @Steps
    private TransferPage transferpage;
    
    @Steps
    private Contacts contacts;
    
    
	
	@Given("^el usuario accede a transferencias$")
    public void pressTransfer() {
		home.clickOntranfer();
	}
	
	@And("^hace click en Nueva Transferencia$")
	public void pressNewTrasnfer() {
		transferpage.clickOnNewTransfer();	
	}
	
	@And("^ingresa el alias (.*)$")
	public void fillAlias(String alias) {
		transferpage.fillAlias(alias);
	}

	@And("^hace click en siguiente$")
	public void clickOnSiguiente()
	{
		transferpage.clickOnSiguiente();
	}

	
	@And("^valida cuil destinatario (.*)$")
	public void validoCuilDestinatario(String cuil)
	{
		transferpage.validarCuilDestinatario(cuil);
	}
	
	
	@And("^valida nombre destinatario (.*)$")
	public void validoDatosDestinatario(String nombre)
	{
		transferpage.validarNombreDestinatario(nombre);
	}
	
	@And("^valida banco destinatario (.*)$")
	public void validoBancoDestinatario(String banco)
	{
		transferpage.validarBancoDestinatario(banco);
	}
	
	@And("^valida numero cuenta destinatario (.*)$")
	public void validoNumeroCuentaDestinatario(String numero)
	{
		transferpage.validarNumeroCuentaDestinatario(numero);
	}
	
	@And("^valida tipo cuenta destinatario (.*)$")
	public void validarTipoCuentaDestinatario(String tipo)
	{
		transferpage.validarTipoCuentaDestinatario(tipo);
	}
	
	@And("^ingresa el monto (.*)$")
	public void ingresoMonto(String monto){
		transferpage.ingresoMonto(monto);
	}
	
	@And("^valido nombre (.*) monto (.*)$")
	public void validoDatosTx(String nombre, String monto) {
		
		transferpage.validoDatosTx(nombre,monto);
	}
	
	@And("^confirma la transferencia$")
	public void confirmTx() {
		
		transferpage.confirmTx();
	}

	@And("^la transferencia se realiza exitosamente con motivo de transferencia varios$")
	public void validarTxExitosa() {
		transferpage.validarTxExitosa();
	}
	
	@And("^puede ver el comprobante de transferencia$")
	public void verComprobante() {
		transferpage.descargarComprobante();
	}
	
	@And("^ingresa el cbu (.*)$")
    public void ingresarCbu(String cbu){
    	transferpage.ingresarCbu(cbu);
    }
	
	@And("^se visualiza el mensaje (.*)$")
	public void validarMensajeAliasInvalido(String mensaje)
	{
		transferpage.validarMensajeAliasInvalido(mensaje);
	}
	
	@And("^selecciona cuenta corriente$")
	public void seleccionaCuentaCorriente() {
		transferpage.selectCc();
	}
	
	@And("^selecciona contacto (.*)$")
	public void seleccionarContacto(String contacto) {
		transferpage.clickContacto(contacto);
	}
	

	
	@Then("^visualiza la home de transferencias empty state$")
	public void validarTransferHomeEmptyState() {
		transferpage.validarTransferHomeEmptyState();
	}
	

	@And("^hace click en siguiente view monto$")
	public void clickOnNextButtonOnAmmountView() {
		transferpage.clickOnNextButtonOnAmmountView();
	}
	
	@And("^cierra teclado si esta visible$")
	public void closeNativeKeyBoardIfPresent() {
		transferpage.closeNativeKeyBoardIfPresent();
	}
	
	@And("^presiona botón Volver a Transferencias$")
	public void userPressBackToTransferBtn() {
		transferpage.userPressBackToTransferBtn();
	}

}

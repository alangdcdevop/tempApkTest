package packages.pageObject;

public class Institutional extends CommonPage {

    //footer -----------------------------------------------------------------------------------------------------------
    static String btnFinancialUserInformation = "btnFinancialUserInformation";
    static String btnCodeOfEthics = "btnCodigoEtica";
    static String btnCommissionComparison = "btnComparacionComisiones";
    static String btnTermsAndConditions = "btnTerminosCondiciones";
    static String btnPersonalDataProtection = "btnPersonalDataProtection";
    static String btnTransparencyRegime = "btnRegimenTransparencia";
    static String btnMoneyLaunderingPrevention = "btnPrevencionLavadoDinero";
    static String btnCustomerDefense = "btnCustomerDefense";
    static String btnAccountClose = "btnAccountClose";
    static String btnBankCustomerPortal = "btnPortalClienteBancario";
    static String btnMaeBondingAgent = "btnAgenteAdherente";
    static String btnFatca = "btnFatca";
    static String btnCookiesPolicy = "btnPoliticaCookies";
    static String btnAgriculturalCensus = "btnCensoAgropecuario";
    static String btnPriceAndCommissions = "btnPrecioComisiones";
    //------------------------------------------------------------------------------------------------------------------

    //Header -----------------------------------------------------------------------------------------------------------
    static String btnBDSLogo = "//*[@id=\"linkLogo\"]/img";
    static String btnMenu = "//*[@id=\"btnNavMobile\"]";
    static String btnAboutUs = "//*[@id=\"btnAboutUs\"]";
    static String btnProducts = "//*[@id=\"btnProducts\"]";
    static String btnContact = "//*[@id=\"btnContact\"]";
    static String btnWhatsApp = "btnWhatsApp";
    static String btnLinkedin = "btnLinkedin";
    //------------------------------------------------------------------------------------------------------------------

    public void pressCodeOfEthics() {
        findElement("id", btnCodeOfEthics).click();
    }

    public void pressCommissionComparison() {
        findElement("id", btnCommissionComparison).click();
    }

    public void pressPEPIdentification() {
    }

    public void pressTermsAndConditions() {
        findElement("id", btnTermsAndConditions).click();
    }

    public void pressMenuTransparencyRegime() {
        findElement("id", btnTransparencyRegime).click();
    }

    public void pressMoneyLaunderingPrevention() {
        findElement("id", btnMoneyLaunderingPrevention).click();
    }

    public void pressConsumerDefense() {
        findElement("id", btnCustomerDefense).click();
    }

    public void pressFinancialUsers() {
        findElement("id", btnFinancialUserInformation).click();
    }

    public void pressBankCustomerPortal() {
        findElement("id", btnBankCustomerPortal).click();
    }

    public void pressMaeBondingAgent() {
        findElement("id", btnMaeBondingAgent).click();
    }

    public void pressFATCA() {
        findElement("id", btnFatca).click();
    }

    public void pressCookiesPolicy() {
        findElement("id", btnCookiesPolicy).click();
    }

    public void pressAgriculturalCensus() {
        findElement("id", btnAgriculturalCensus).click();
    }

    public void pressPriceAndCommissions() {
        findElement("id", btnPriceAndCommissions).click();
    }

    public void pressLinkedin() {
        findElement("id", btnLinkedin).click();
    }

    public void pressFinancialUserInformation() {
        findElement("id", btnFinancialUserInformation).click();
    }

    public void pressPersonalDataProtection() {
        findElement("id", btnPersonalDataProtection).click();
    }

    public void pressNationalAddressPersonalDataProtection() {
    }

    public void pressClosingAccounts() {
        findElement("id", btnAccountClose).click();
    }

    public void pressBDSLogo() {
        waitForPageLoaded();
        findElement("xpath", btnBDSLogo).click();
    }

    public void validateCorrectPage(String actualURL) {
        validateURL(actualURL);
    }

    public void pressMenu() {
        waitForPageLoaded();
        findElement("xpath", btnMenu).click();
    }

    public void pressAboutUs() {
        findElement("xpath", btnAboutUs).click();
    }

    public void pressProducts() {
        findElement("xpath", btnProducts).click();
    }

    public void pressContact() {
        findElement("xpath", btnContact).click();
    }

    public void pressWhatsApp() {
        findElement("id", btnWhatsApp).click();
    }

    public void pressLinkFinancialUsers() {
    }
}

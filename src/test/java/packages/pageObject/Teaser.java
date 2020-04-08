package packages.pageObject;

import org.junit.Assert;

public class Teaser extends CommonPage {

    static String btnWantToParticipate = "btnWantToParticipateMobile";
    static String btnNextOne = "btnNextOne";
    static String btnNextTwo = "btnNextTwo";
    static String btnNextThree = "btnNextThree";
    static String btnSend = "btnSend";
    static String btnSkipOne = "btnSkipOne";
    static String btnSkipTwo = "btnSkipTwo";
    static String btnSkipThree = "btnSkipThree";
    static String inpEmail = "inpEmail";
    static String divThanks = "thanks";
    static String divFooter = "footer";


    public void pressWantToParticipate() {
        findElement("id", btnWantToParticipate).click();
    }

    public void answerFirstQuestion() {
        waitForPageLoaded();
        findElement("id", btnNextOne).click();
    }

    public void sendEmail(String email) {
        findElement("id", inpEmail).sendKeys(email);
    }

    public void answerThirdQuestion() {
        waitForPageLoaded();
        findElement("id", btnNextThree).click();
    }

    public void skipSecondQuestion() {
        waitForPageLoaded();
        findElement("id", btnSkipTwo).click();
    }

    public void showSuccessPoster() {
        waitForPageLoaded();
        if (!findElement("id", divThanks).isDisplayed()) {
            Assert.fail("No se visualizo el cartel de agradecimiento");
        }
    }

    public void answerSecondQuestion() {
        waitForPageLoaded();
        findElement("id", btnNextTwo).click();
    }

    public void skipThirdQuestion() {
        waitForPageLoaded();
        findElement("id", btnSkipThree).click();
    }

    public void skipFirstQuestion() {
        waitForPageLoaded();
        System.out.println(findElement("id", btnSkipOne).isDisplayed());
        findElement("id", btnSkipOne).click();
    }

    public void pressSend() {
        findElement("id", btnSend).click();
    }

    public void showQuestions() {
    }

    public void mailField() {
    }

    public void showButton() {
    }

    public void showInput() {
    }

    public void sendValue(String sendValue) {
    }

    public void checkValue(String checkValue) {
    }

    public void answerQuestions() {
    }
}

package packages.utils;

import org.junit.Test;

import java.util.ArrayList;

public class addMovements {

    @Test
    public void test() {
        String token = AgendaService.getToken("bdsolqe+int1@gmail.com", "663755");
        ArrayList account = AccountsMeService.accountsMe(token);
        //	String account = AddMovementsToAccount.accountsMe(token);
        String accountNumber = account.get(0).toString();
        System.out.println(accountNumber);

        String refNo = AddMovementsToAccount.newDebin();
        String moveOk = AddMovementsToAccount.authDebin(refNo, accountNumber);
        System.out.println(moveOk);
    }
}

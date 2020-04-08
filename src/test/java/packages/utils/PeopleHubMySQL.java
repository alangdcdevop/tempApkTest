package packages.utils;

import net.thucydides.core.annotations.Step;
import packages.stepdefinitions.LoginSteps;

import java.sql.*;
import java.util.UUID;

public class PeopleHubMySQL {
    private static Connection connect;
    private static Statement statement;
    private static PreparedStatement preparedStatement;
    private static String host = "microservices-" + System.getProperty("testing.enviroment") + "-mysql.mysql.database.azure.com";
    private static String port = "3306";
    private static String database = "people_hub_" + System.getProperty("testing.enviroment");
    private static String user = "people_hub@microservices-" + System.getProperty("testing.enviroment") + "-mysql";
    private static String password = "r9bXGPvn89YvR7xG4H7f35";


    public static void deleteTermsAccepted(String keycloakUserId) throws Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connect = DriverManager
                    .getConnection("jdbc:mysql://" + host + ":" + port + "/" + database + "?"
                            + "user=" + user + "&password=" + password + "&serverTimezone=UTC");

            statement = connect.createStatement();
            preparedStatement = connect
                    .prepareStatement("delete from terms_accepted where keycloak_user_id=?; ");
            preparedStatement.setString(1, keycloakUserId);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            close();
        }

    }

    private static void close() {
        try {


            if (statement != null) {
                statement.close();
            }

            if (connect != null) {
                connect.close();
            }
        } catch (Exception e) {

        }
    }

    @Step
    public void resetMaritalStatus() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connect = DriverManager
                    .getConnection("jdbc:mysql://" + host + ":" + port + "/" + database + "?"
                            + "user=" + user + "&password=" + password + "&serverTimezone=UTC");

            statement = connect.createStatement();
            preparedStatement = connect
                    .prepareStatement("update person set marital_status=? where last_name=?; ");
            preparedStatement.setNull(1, Types.VARCHAR);
            preparedStatement.setString(2, MailHandler.getJWTClaimsFromMagicLink().getFamily_name());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
        } finally {
            close();
        }
    }

    public static void unlinkDevices() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connect = DriverManager
                    .getConnection("jdbc:mysql://" + host + ":" + port + "/" + database + "?"
                            + "user=" + user + "&password=" + password + "&serverTimezone=UTC");
            statement = connect.createStatement();
            preparedStatement = connect
                    .prepareStatement("SELECT id FROM profile where username=?;");
            preparedStatement.setString(1, LoginSteps.getMail());
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println("Desvinculando dispositivo con cuenta: " + LoginSteps.getMail());
            int profileId = 0;
            if (rs.next()) {
                profileId = rs.getInt("id");
            }
            preparedStatement = connect
                    .prepareStatement("delete from device where profile_id=?;");
            preparedStatement.setInt(1, profileId);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            close();
        }
    }

    @Step
    public static void linkRandomDevices(int amount) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connect = DriverManager
                    .getConnection("jdbc:mysql://" + host + ":" + port + "/" + database + "?"
                            + "user=" + user + "&password=" + password + "&serverTimezone=UTC");

            statement = connect.createStatement();
            preparedStatement = connect
                    .prepareStatement("SELECT p.id FROM profile p\n" +
                            "join keycloak k on k.id=p.keycloak_id\n" +
                            "where k.user_id=?;");
            preparedStatement.setString(1, MailHandler.getKeyCloakUserId());
            ResultSet rs = preparedStatement.executeQuery();
            int profileId = rs.getInt("id");

            for (int i = 0; i < amount; i++) {
                preparedStatement = connect
                        .prepareStatement("insert into device ('profile_id','uid','model','name','ip_address') values (?,?,?,?,?)");
                preparedStatement.setInt(1, profileId);
                preparedStatement.setString(2, UUID.randomUUID().toString());
                preparedStatement.setString(3, UUID.randomUUID().toString());
                preparedStatement.setString(4, UUID.randomUUID().toString());
                preparedStatement.setString(5, "10.0.0.1");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public static String getMaritalStatus() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connect = DriverManager
                    .getConnection("jdbc:mysql://" + host + ":" + port + "/" + database + "?"
                            + "user=" + user + "&password=" + password + "&serverTimezone=UTC");

            statement = connect.createStatement();
            preparedStatement = connect
                    .prepareStatement("SELECT p.marital_status FROM person p\n" +
                            "join profile pr on p.profile_id=pr.id\n" +
                            "join keycloak k on k.id=pr.keycloak_id\n" +
                            "where k.user_id=?;");
            preparedStatement.setString(1, MailHandler.getKeyCloakUserId());
            ResultSet rs = preparedStatement.executeQuery();
            return rs.getString("marital_status");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } finally {
            close();
        }
    }

}

package packages.utils;


public class MongoDB {


    // private static String mongoHost = "terms-and-conditions-" + System.getProperty("testing.enviroment") + ".documents.azure.com:10255";
    // private static String user = "terms-and-conditions-" + System.getProperty("testing.enviroment");
    // private static String pass = "xww3QWYVg0Pxwq1IZDDQb2Ycvlt14S51q4aTwN1j2pkuDBPEb6eyEBVfYiIbo3RqNx3UCEecnjVwu09oL6KxaA=="; //TODO: SACAR HARDCODING DE ACA
    // private static String database = "terms-and-conditions";
    // private static String replicaset = "globaldb";


    // public static void deleteTestTerms(String documentUrl) {
    //     Logger.getLogger("org.mongodb.driver").setLevel(Level.SEVERE);
    //     String url = "mongodb://" + user + ":" + pass + "@" + mongoHost + "/?ssl=true&replicaSet=" + replicaset;
    //     MongoClientURI uri = new MongoClientURI(url);
    //     MongoClient mongoClient = new MongoClient(uri);
    //     MongoDatabase mongoDatabase = mongoClient.getDatabase(database);
    //     MongoCollection collection = mongoDatabase.getCollection("terms");
    //     Bson query = Filters.eq("url", documentUrl);
    //     collection.deleteMany(query);
    // }

}

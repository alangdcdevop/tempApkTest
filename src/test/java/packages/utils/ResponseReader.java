package packages.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class ResponseReader {

    public static String read(String fileName) {
        ClassLoader classLoader = ResponseReader.class.getClassLoader();
        System.err.println(fileName);
        InputStream resource = classLoader.getResourceAsStream(fileName);

        if (resource == null) {
            throw new IllegalArgumentException("file is not found!");
        }

        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(resource));
            StringBuilder sb = new StringBuilder();

            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }

            return new String(Base64.getEncoder().encode(sb.toString().getBytes()), StandardCharsets.UTF_8);
        } catch (IOException e) {
            throw new IllegalArgumentException("error reading file!");
        }
    }
}

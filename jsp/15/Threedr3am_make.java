import com.sun.org.apache.bcel.internal.classfile.Utility;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * @author threedr3am
 */
public class Threedr3am_make {

    public static void main(String[] args) throws IOException {
        InputStream inputStream = Threedr3am_make.class.getClassLoader().getResourceAsStream("Threedr3am_15.class");
        byte[] bytes = new byte[inputStream.available()];
        inputStream.read(bytes);
        String code = "$$BCEL$$" + Utility.encode(bytes, true);
        bytes = code.getBytes();
        for (int i = 0; i < bytes.length; i++) {
            System.out.print(bytes[i]);
            if (i != bytes.length - 1)
                System.out.print(",");
        }
    }
}
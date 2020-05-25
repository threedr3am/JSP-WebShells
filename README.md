*工具仅用于安全研究以及内部自查，禁止使用工具发起非法攻击，造成的后果使用者负责*

### JSP-Webshells集合

1. BCEL字节码的JSP Webshell
2. 自定义类加载器的JSP Webshell
3. ScriptEngine.eval的JSP Webshell
4. URLClassLoader加载远程jar的JSP Webshell
5. javac动态编译class的JSP Webshell
6. jdk.nashorn.internal.runtime.ScriptLoader类加载器加载的JSP Webshell
7. java.lang.ProcessImpl JSP Webshell
8. java.lang.ProcessBuilder Webshell
9. MethodAccessor.invoke绕过检测Method.invoke的JSP Webshell
10. SPI机制的ScriptEngineManager自动加载实例化JSP Webshell
11. 利用TemplatesImpl触发的JSP Webshell
12. 重写ObjectInputStream.resolveClass实现反序列化readObject触发的JSP Webshell
13. JdbcRowSetImpl进行jndi注入的JSP Webshell
14. tomcat el的JSP Webshell
15. BCEL类加载器进行一定包装-可能在某些禁了loadClass方法的地方bypass的JSP Webshell
16. VersionHelper包装的URLClassLoader类加载器的JSP Webshell 
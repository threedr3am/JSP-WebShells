*工具仅用于安全研究以及内部自查，禁止使用工具发起非法攻击，造成的后果使用者负责*

### JSP-WebShells集合

1. BCEL字节码的JSP WebShell
2. 自定义类加载器的JSP WebShell
3. ScriptEngine.eval的JSP WebShell
4. URLClassLoader加载远程jar的JSP WebShell
5. javac动态编译class的JSP WebShell
6. jdk.nashorn.internal.runtime.ScriptLoader类加载器加载的JSP WebShell
7. java.lang.ProcessImpl JSP WebShell
8. java.lang.ProcessBuilder WebShell
9. MethodAccessor.invoke绕过检测Method.invoke的JSP WebShell
10. SPI机制的ScriptEngineManager自动加载实例化JSP WebShell
11. 利用TemplatesImpl触发的JSP WebShell
12. 重写ObjectInputStream.resolveClass实现反序列化readObject触发的JSP WebShell
13. JdbcRowSetImpl进行jndi注入的JSP WebShell
14. Tomcat EL的JSP WebShell
15. BCEL类加载器进行一定包装-可能在某些禁了loadClass方法的地方bypass的JSP WebShell
16. VersionHelper包装的URLClassLoader类加载器的JSP WebShell 
17. Runtime.exec的JSP WebShell
18. 利用TemplatesImpl反序列化的JSP WebShell
19. 精简一句话ScriptEngine.eval的JSP WebShell
20. 反射调用 Proxy native 方法 defineClass0 加载类字节码 WebShell
21. 使用JDK自带的ASM框架构造字节码并加载 WebShell
22. 利用jsp标签属性注入解析后代码的JSP WebShell

### 分类

#### 一、命令执行/反射调用
1. java.lang.ProcessImpl JSP WebShell: 7.jsp
2. java.lang.ProcessBuilder WebShell: 8.jsp
3. Runtime.exec的JSP WebShell: 17.jsp
4. MethodAccessor.invoke绕过检测Method.invoke的JSP WebShell: 9.jsp
5. 利用随机数运行时可知字符串绕过检测的Runtime.exec的JSP WebShell: 17_2.jsp

#### 二、脚本执行
1. ScriptEngine.eval的JSP WebShell: 3.jsp
2. Tomcat EL的JSP WebShell: 14.jsp
3. 精简一句话ScriptEngine.eval的JSP WebShell: 19.jsp/19_2.jsp

#### 三、字节码、反序列化相关
1. BCEL字节码的JSP WebShell: 1.jsp
2. 自定义类加载器的JSP WebShell: 2.jsp
3. URLClassLoader加载远程jar的JSP WebShell: 4.jsp
4. jdk.nashorn.internal.runtime.ScriptLoader类加载器加载的JSP WebShell: 6.jsp
5. SPI机制的ScriptEngineManager自动加载实例化JSP WebShell: 10.jsp
6. 利用TemplatesImpl触发的JSP WebShell: 11.jsp
7. 重写ObjectInputStream.resolveClass实现反序列化readObject触发的JSP WebShell: 12.jsp
8. JdbcRowSetImpl进行jndi注入的JSP WebShell: 13.jsp
9. BCEL类加载器进行一定包装-可能在某些禁了loadClass方法的地方bypass的JSP WebShell: 15.jsp
10. VersionHelper包装的URLClassLoader类加载器的JSP WebShell: 16.jsp 
11. 利用TemplatesImpl反序列化的JSP WebShell: 18.jsp
12. 利用 Proxy native 方法 defineClass0 加载类字节码 WebShell: 20.jsp

#### 四、动态编译
1. javac动态编译class的JSP WebShell: 5.jsp

#### 五、标签注入
1. 利用jsp标签属性注入解析后代码的JSP WebShell: 22.jsp

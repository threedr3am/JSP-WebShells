### tomcat el的JSP WebShell

使用：
```
1.把jsp文件放到能被解析的服务器目录，例：tomcat的webapps/ROOT

2.在浏览器访问14.jsp，并使用参数cmd传入需要远程执行的命令，例：http://127.0.0.1:8080/14.jsp?cmd=whoami

3.在浏览器访问14_2.jsp，并使用参数cmd传入需要远程执行的命令，例：http://127.0.0.1:8080/14_2.jsp?cmd=whoami

4.服务器将会执行相应的shell命令，最后回显
```
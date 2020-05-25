### java.lang.ProcessBuilder Webshell

使用：
```
1.把jsp文件放到能被解析的服务器目录，例：tomcat的webapps/ROOT

2.在浏览器访问8.jsp，并使用参数threedr3am传入需要远程执行的命令，例：http://127.0.0.1:8080/8.jsp?threedr3am=whoami

3.服务器将会执行相应的shell命令，最后回显
```
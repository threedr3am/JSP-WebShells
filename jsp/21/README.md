### 使用JDK自带的ASM框架构造字节码并加载 WebShell

主要原理参考第1条和第20条：BCEL和Proxy native defineClass0

将其中较为复杂的字节码构造部分替换为ASM构造，无需单独依赖，JDK自带ASM库
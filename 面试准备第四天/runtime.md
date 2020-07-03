1、runtime是什么？
 我们都知道，讲源代码转换成可执行程序的时候要经过三个步骤：编译，链接，运行。OC作为一门动态性的变成语言会把一些决定性的工作从编译阶段，链接阶段推迟到运行时阶段的机制，是的OC变得更加灵活，而实现OC运行时机制的基础就是runtime，runtime其实就是一个库，这个库使我们可以在程序运行时，动态的创建对象，检查对象修改类和对象的方法。

2、runtime的数据结构？
 数据结构为objc_object,objc_class,isa指针，method_t
 objc_object：我们平时使用的对象其实都是id类型的，id类型在runtime中就是objc_object这样的一个结构体
 objc_class:OC中类对象Class在runtime中对应的是objc_class结构体，objc_class继承至objc_object，
 isa指针：是一个共用体isa_t


3、objc_object包含哪些内容？
 objc_object包含isa_t，关于isa的操作相关，弱引用相关，关联对象相关，内存管理相关
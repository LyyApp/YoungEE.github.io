1、runtime是什么？
 我们都知道，讲源代码转换成可执行程序的时候要经过三个步骤：编译，链接，运行。OC作为一门动态性的变成语言会把一些决定性的工作从编译阶段，链接阶段推迟到运行时阶段的机制，是的OC变得更加灵活，而实现OC运行时机制的基础就是runtime，runtime其实就是一个库，这个库使我们可以在程序运行时，动态的创建对象，检查对象修改类和对象的方法。

2、runtime的数据结构？
 数据结构为objc_object,objc_class,isa指针，method_t
 objc_object：我们平时使用的对象其实都是id类型的，id类型在runtime中就是objc_object这样的一个结构体
 objc_class:OC中类对象Class在runtime中对应的是objc_class结构体，objc_class继承至objc_object，
 isa指针：是一个共用体isa_t


3、objc_object包含哪些内容？
 objc_object包含isa_t，关于isa的操作相关，弱引用相关，关联对象相关，内存管理相关

4、objc_class包含哪些内容
 objc_class继承自objc_object，所以里面还有isa_t类型的结构体isa，除此之外还包含Class superClass父类指针，cache_t cache方法缓存，class_data_bits_t bits实例方法链表。

5、何为isa指针
 isa指针是一个共用体类型(isa_t)，一般是32位或者64位不过现在的一般都是64位的系统所以一般常见的是64位的。其中又包含两种类型：①指针型isa，其值代表的Class的地址。②非指针型isa，其部分值代表的Class的地址，其余位则表示相关内用从而达到节约内存的作用

6、isa的指向
 关于对象，也就是实例，在runtime中对应的是objc_object，他其中的isa指针指向的是对应的类
 关于类，在runtime中对应的是objc_class继承自objc_object，他的isa指针指向其原类对象metaClass
 所以在进行方法调用时，实例会通过isa指针去类中进行查找，类的isa指针会去对应的原类对象中查找

7、何为cache_t？工作原理以及有什么作用？
 cache_t是一个数组，里面的每一个元素都是一个bucket_t，其中bucket_t可以看作是一个hashMap，key:cache_key_t _key即selector value：IMP _imp是一个无类型的函数指针。
 一般的方法查找流程：当对象receiver调用方法message时，会通过receiver的isa指针去查找他对应的类，然后在类的methodlist去搜索方法，有则执行，没有则使用super_class的指针到父类中的methodList去搜索，如果没有则有可能消息转发，有可能忽略
 使用cache来缓存经常使用的方法，当调用方法时优先去cache搜索如果没有，在到methods里面去搜索
 cache_t的作用：是用于快速查找方法执行函数，是可以增量扩展的哈希表结构，是局部性原理的最佳应用。
 局部性原理：在调用方法的时候，往往调用的都是调用频次最高的，这是把这些方法放在缓存中，下次命中的概率会高一些

8、class_data_bits_t的组成？
 class_data_bits_t主要是对class_rw_t的封装；class_rw_t代表了类相关的读写操作，是对class_ro_t的封装；class_ro_t代表了类相关的只读信息
 class_rw_t数据结构：class_ro_t，protocols，property，methods后三个为一个二位数组,methods数组中的元素为method_t，可读写
 class_ro_t数据结构：name，一维数组(ivars,protocols,property,methodList)，methodList数组中的元素为method_t,只读
 类在内存中的位置是在编译期间决定的，在之后修改代码也不会改变他在内存中的位置
 类的方法,属性以及协议在编译期间存放在"错误"的位置,知道realizeClass执行之后，才放到class_re_t指向的只读区域class_ro_t中。这样我们既可以在运行时为class_rw_t添加只读方法，也不会影响类的只读的结构
 在class_ro_t中的属性在运行时不能改变，在添加方法只会改变class_rw_t中的methods，而不会影响class_ro_t中的methodList

9、method_t的机构以及每个字段的作用？
 函数的四要素：名称，返回值，参数，函数体
 method_t是一个结构体他的数据结构：SEL name,const char* types,IMP imp;
 其中name对应的四要素中的名称，types对应的四要素的返回值以及参数，imp对应的函数体

10、对象，类对象，元类对象
 类对象存储实例方法列表等信息，元类对象存储类方法列表等信息
 对象在runtime对应的是objc_object，他的isa指针指向类对象
 类对象runtime对应的是objc_class，他继承自objc_object，所以他的isa指针指向的原类对象，superClass指向的是nil，因为他是一个nsobjct没有父类
 元类对象runtime对应的也是objc_class，也是继承自objc_object，他的isa指针指向的是根元类对象，superClass指向的是根类对象
 查看经典的一个面试题。详见工程


消息传递
1、objc_msgSend数据结构
 void objc_msgSend(void /*id self,SEL op,...*/)需要接受固定的两个参数，第一个 id类型的self，第二个SEL 的方法选择器名称，后面的是消息传递的参数，如[self class]<-->objc_msgSend(self,@selector(class))

2、objc_msgSendSuper数据结构
 void objc_msgSendSuper(void /*structs objc_super *super,SEL op ,...*/),第一个 super结构体，第二个 SEL方法选择器，后面的是消息传递的参数
 structs objc_super{
 	_unsafe_unretained id receiver;(实际就是当前对象)
 }
 [super class]<-->void objc_msgSendSuper(super,@selector(class))

 所以上面的面试题的答案就是不管是[self class] 还是[super class]都是调用的当前对象

3、消息传递机制
 缓存查找，当前类查找，父类逐级查找
 消息传递机制步骤为，先进行缓存查找，命中则调用结束，未命中则进行当前类查找，当前类查找命中则调用结束，未命中进行逐级父类查找，父类查找命中则调用结束，未命中则消息转发结束流程

4、缓存查找的流程与步骤
 缓存查找实际上就是根据给定的方法选择器(SEL),来查找(bucket_t)中对应的方法实现(IMP),bucket_t是方法选择器和方法实现的封装体，根据SEL去cache_t中查找bucket_t，cache_key_t---f(key)--->bucket_t   f(key) = key & mask
 具体步骤：
 1、根据给定的方法选择器(SEL),通过一个函数f(key)来映射出对应的bucket_t在数组中的位置，这部其实就是哈希查找。
 2、经过哈希函数算法key&mask(选择器因子key和对应的一个mask做谓语操作)算出的值就是给定值在对应数组中的索引位置提高查找效率。
 3、找到选择器因子对应的bucket_t之后，可以提取对应的IMP函数指针，返回给调用方。

5、当前类查找
 ①当前类中有对应的方法列表
 ②对于已排序好的方法列表，采用二分查找算法查找方法对应的执行函数实现
 ③对于没有排序好的方法类表，采用一般遍历去查找方法对应的执行函数实现

6、父类逐级查找
 ①通过当前类的superClass去查找父类，如果当前类是nsobject他的父类为nil 则结束查找流程
 ②当前类的不为nsobject，则去查找父类的缓存是否命中，命中则结束查找流程，没有命中则去遍历方法列表，命中结束流程没有命中重复前面的步骤


消息转发机制
 动态方法解析、快速消息转发机制、标准消息转发机制
 动态方法解析：首先征询接收者所属的类，看其是否能动态添加调用方法，来处理当前这个未知的选择子。
 			实例方法：+(BOOL) resolveInstanceMethod:(SEL) selector
 			类方法：+(BOOL) resolveClassMethod:(SEL) selector
 快速消息转发机制：寻找是否在其他类对象内有该方法的实现，并将改消息转发给此对象，如果目标对象实现了该方法，Runtime这时就会调用这个方法，给你把这个消息转			      发给其他类对象的机会，只要这个方法返回的不是nil或者self，整个消息发送的过程就会被重启，
 			  当然返回的对象就是return的对象否则就会继续normal forwarding
 			  使用到的方法为：-(id)forwardingTargetForSelector:(SEL) aSelector;
 标准消息转发机制(normal forwarding)：这一步是消息转发机制的最后一步，首先会发送消息会的函数的参数和返回值，如果返回nil，runtime会发出doesNotRec				ognizeSelector消息，然后crash，若是返回一个函数签名，runtime就会创建一个NSInvocation对象并发送消息给目标对象
 			 使用到的方法：获取函数的参数和返回值：-(Methodsignature *)methodSigatureForSelector:(SEL) aSelector;
 			 			发送消息给目标对象:-(void)forwardInvocation:(NSInvocation*) Invocation;
消息转发机制详细代码见工程代码



Method-Swizzling
1、什么是Method-Swizzling
 Method-Swizzling是方法交换，其中交换的是方法的实现，我们用@selector(方法选择器)取出来的是一个方法的编号(指向方法的指针)，用SEL类型表示；它所指向的是一个IMP(方法实现的指针),而我们交换的就是这个IMP，从而达到方法实现交换的效果。

2、Method-swizzling的原理
 

 

 




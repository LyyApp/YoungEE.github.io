1、KVO是什么？
 KVO是key-value-obsering的缩写，KVO是Object-C队观察者模式的又一体现，Apple使用了isa的混写(isa-swizzling)来实现KVO

2、什么是isa-swizzling，ISA混写技术？
 isa混写技术,简述的讲就是把isa的指向进行修改就是isa混写技术，观察者在观察一个对象A(Setter Method  isa pointer)，当调用了kvo的addobserver观察方法之后，系统会为我们在运行时自动创建一个NSKVONotifying_A这么一个类，同时将A的isa指针指向NSKVONotifying_A(继承A)，之所以是A的子类，就是为了重写Setter方法，从而达到通知所有观察对象

 问题、讲讲isa混写技术是怎么在KVO中体现的
 当我们对象A调用了addobserverforkeypath方法之后，系统会在运行时给我们自动创造一个NSKVONtifying_A这么一个类，同时将原来的A对象的isa指针指向NSKVONotifying_A类

3、KVO子类重写的setter方法？
 重写的方法有两个：willchangevalueforkey:(nsstring*)key,didchangevalueforkey(nsstring*)key

4、NSKVONotifying_A的setter实现
 -(void) setvalue:(id) value{
 	[self willChangeValueForKey:@"keyPath"];
 	[super setValue:value];
 	[self didChangeValueForKey:@"keyPath"];
 }

5、通过kvc的方式能否触发KVO并且生效?
 可以生效，因为KVC触发了setValue方法所以生效

6、通过成员变量直接赋值能否生效？
 不能  必须要手动加上KVO才能实现 即在成员变量的前后加上willchangeValueForKey,didChangeValueForKey这两个方法

 上述两种生效的方式详见代码 kvo_test


 7、总结
  ①使用setter方法改变值KVO才会生效 ②使用setvalue：forkey：改变值KVO才能生效 ③成员变量直接修改值需要手动添加KVO才能生效

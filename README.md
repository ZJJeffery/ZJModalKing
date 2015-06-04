# ZJModalKing
##Demo
![sample](http://img.blog.csdn.net/20150604142902535)

###Constom Modal Transition Animation Framework

Give an modal View Controller with its frame which is need to present in the screen, Also give a present animation block and dismiss animation block. Then its transition will do what you want.

There are two methods for modal:

* First is nomal present, which you will call dismiss method by yourself.

* Second is like a pop menu, it will create a dummingView with clear color, when you click the space out of the modal view, it will dismiss automaticaly. 



```objectivec
/**
 *  First way without dumming view
 *
 *  @param modalVC          modal view controller
 *  @param presentFrame     modal view frame in screen
 *  @param presentAnimation present animation block. return timeinterver of animation time
 *  @param dismissAnimation dismiss animation block. return timeinterver of animation time

 *  @param completion       comletion block
 */
-(void)mk_presentViewController:(UIViewController *)modalVC
               withPresentFrame:(CGRect)presentFrame
           withPresentAnimation:(NSTimeInterval (^)(UIView *view))presentAnimation
           withDismissAnimation:(NSTimeInterval (^)(UIView *view))dismissAnimation
                 withCompletion:(void (^)(void))completion;

/**
 *  Second way with dumming view
 *
 *  @param modalVC          modal view controller
 *  @param presentFrame     modal view frame in screen
 *  @param presentAnimation present animation block. return timeinterver of animation time
 *  @param dismissAnimation dismiss animation block. return timeinterver of animation time

 *  @param completion       comletion block
 */
-(void)mk_presentViewControllerWithDummingView:(UIViewController *)modalVC
               withPresentFrame:(CGRect)presentFrame
           withPresentAnimation:(NSTimeInterval (^)(UIView *view))presentAnimation
           withDismissAnimation:(NSTimeInterval (^)(UIView *view))dismissAnimation
                 withCompletion:(void (^)(void))completion;

``` 

###自定义modal转场动画框架

给定一个modal的视图控制器和他在界面上需要显示的fram，同时在加上一个显示动画和消失动画既可以产生自定义modal转场效果

这里提供了两个调用方法：

* 第一种是普通情况，也就是使用者自己在视图控制器内部恰当的控件上实现dismiss的方法调用
* 第二种是特殊情况，可以类似菜单效果，框架提供了一个透明的遮罩在modal视图的后面，框架提供了点击遮罩可以自动dismiss的效果。

```
/**
 *  无遮罩方法
 *
 *  @param modalVC          需要展示的viewController
 *  @param presentFrame     展示视图在屏幕的frame
 *  @param presentAnimation 展示动画代码（返回的时间是转场动画上下文关闭的时间）
 *  @param dismissAnimation 消失动画代码（返回的时间是转场动画上下文关闭的时间）
 关于转场动画上下文时长说明：
 转场动画上下文关闭的时间决定了改转场动画封锁界面的用户交互能力的时长，如果返回0表示立马接受用户交互，
 那么可能存在在动画过程中用户交互而导致动画达不到预期效果。
 一般建议返回动画的时间长度，正好动画结束，然后开启用户交互能力。
 特殊需求可以填写特殊时长
 *  @param completion       完成回调
 */
-(void)mk_presentViewController:(UIViewController *)modalVC
               withPresentFrame:(CGRect)presentFrame
           withPresentAnimation:(NSTimeInterval (^)(UIView *view))presentAnimation
           withDismissAnimation:(NSTimeInterval (^)(UIView *view))dismissAnimation
                 withCompletion:(void (^)(void))completion;

/**
 *  自带透明遮盖，点击非跳转界面可以dismiss
 *
 *  @param modalVC          需要展示的viewController
 *  @param presentFrame     展示视图在屏幕的frame
 *  @param presentAnimation 展示动画代码（返回的时间是转场动画上下文关闭的时间）
 *  @param dismissAnimation 消失动画代码（返回的时间是转场动画上下文关闭的时间）
 关于转场动画上下文时长说明：
 转场动画上下文关闭的时间决定了改转场动画封锁界面的用户交互能力的时长，如果返回0表示立马接受用户交互，
 那么可能存在在动画过程中用户交互而导致动画达不到预期效果。
 一般建议返回动画的时间长度，正好动画结束，然后开启用户交互能力。
 特殊需求可以填写特殊时长
 *  @param completion       完成回调
 */
-(void)mk_presentViewControllerWithDummingView:(UIViewController *)modalVC
               withPresentFrame:(CGRect)presentFrame
           withPresentAnimation:(NSTimeInterval (^)(UIView *view))presentAnimation
           withDismissAnimation:(NSTimeInterval (^)(UIView *view))dismissAnimation
                 withCompletion:(void (^)(void))completion;
```
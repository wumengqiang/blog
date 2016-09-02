##React Native组件学习

### View
	View是创建UI时最基础的组件，支持Flexbox布局、样式、触摸处理、无障碍功能。首先从View来分析吧。

#### 无障碍功能
可能会不常用，但还是列出来。

- accessibilityLabel string 用于设置读屏器（视力障碍人士阅读用）阅读的文字。
- accessible bool 当值为true时，表示启动了无障碍功能。默认情况下，所有可触摸操作的元素都是无障碍功能元素。
- onAccessibilityTap(ios) accessible为true时，用户双击触发该事件。
- onMagicTap(ios)  accessible为true时，用户双击触发该事件。
- __onLayout__  该事件会在布局计算完成后调用，调用时可能新的布局并没有在屏幕上呈现。参数为{nativeEvent: { layout: {x, y, width, height}}}。
- __hitSlop__  在不影响元素宽高的情况下，增加元素的可点击区域hitSlop={{top: 10, bottom: 10, left: 0, right: 0}}表示可点击区域由元素区域向上扩充10dp,向下扩充10dp。
注意扩充的点击区域不会超过父元素的边界并且如果扩充的区域与兄弟元素相重叠，兄弟元素拥有更高的优先级来处理touch事件。

```
	touch事件参数 
		nativeEvent: {
			changedTouches - 从上次触发事件之后所有发生过变化的touch事件列表
			identifier - touch ID（可以用来表示touch事件）
			locationX - touch位置与被点击元素在x轴上的位移
			locationY - touch位置与被点击元素在y轴上的位移
			pageX - touch位置与根元素在x轴的位移
			pageY - touch位置与根元素在y轴的位移
			target - 被点击的元素id
			timestamp - 点击事件的时间戳
			touches - 当前所有的touch点列表
		
		}
```

- __onResponderMove—__ 用户在View上移动手指时触发，事件参数如上，设置方式：View.props.onResponderMove: (event) => {}。
- __onResponderReject__ 有新的响应者已经生效并使得该view无法成为响应者，此时触发该事件。
- View组件拥有响应者生命周期的全部事件，所以可以参考下面的__响应者的生命周期__。

#### 响应者的生命周期  
 复制粘贴自[这篇文章](http://reactnative.cn/docs/next/gesture-responder-system.html)， 关于手势信息可以参考[这篇文章](http://reactnative.cn/docs/next/panresponder.html)
###### 阶段一 点击时询问是否想要成为响应者
一个View只要实现了正确的协商方法，就可以成为触摸事件的响应者。我们通过两个方法去“询问”一个View是否愿意成为响应者：

- `View.props.onStartShouldSetResponder: (evt) => true`, - 在用户开始触摸的时候（手指刚刚接触屏幕的瞬间），是否愿意成为响应者？
- `View.props.onMoveShouldSetResponder: (evt) => true`, - 如果View不是响应者，那么

###### 阶段二 点击移动时询问是否想要成为响应者
在每一个触摸点开始移动（没有停下也没有离开屏幕）时再询问一次：是否愿意响应触摸交互呢？
如果View返回true，并开始尝试成为响应者，那么会触发下列事件之一:

- `View.props.onResponderGrant: (evt) => {}` - View现在要开始响应触摸事件了。这也是需要做高亮的时候，使用户知道他到底点到了哪里。
- `View.props.onResponderReject: (evt) => {}` - 响应者现在“另有其人”而且暂时不会“放权”，请另作安排。

######阶段三 已经成为响应者
如果View已经开始响应触摸事件了，那么下列这些处理函数会被一一调用：

- `View.props.onResponderMove: (evt) => {}` - 用户正在屏幕上移动手指时（没有停下也没有离开屏幕）。
- `View.props.onResponderRelease: (evt) => {}` - 触摸操作结束时触发，比如"touchUp"（手指抬起离开屏幕）。
- `View.props.onResponderTerminationRequest: (evt) => true` - 有其他组件请求接替响应者，当前的View是否“放权”？返回true的话则释放响应者权力。
- `View.props.onResponderTerminate: (evt) => {}` - 响应者权力已经交出。这可能是由于其他View通过onResponderTerminationRequest请求的，也可能是由操作系统强制夺权（比如iOS上的控制中心或是通知中心）。
		
### ScrollView
View内部区域是不能滚动的，因而如果内容超过元素高度，可以采用ScrollView或者ListView。如果内容相似性非常大，可以采用ListView,如果相似性不大，可以采用ScrollView。
ScrollView可以设置高度（如果把ScrollView放在最外层设置高度是无效的，高度总是屏幕高度）。


### ListView
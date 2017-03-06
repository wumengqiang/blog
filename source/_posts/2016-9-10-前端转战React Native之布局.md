---
laypost:post
title: ReactNative布局
tags: ReactNative
categories: 布局
description: ReactNative布局基础学习
---

### 前言
  心血来潮想学React Native，发现不会布局了，工欲善其事，必先利其器，所以一步一步开始学习布局。
###  参考文章
[陈学家_6174的react-native 之布局篇](https://segmentfault.com/a/1190000002658374)

### 正文

#### 单位
#####布局单位 
与css不一样，react-native在设置宽高时不需要带单位，其默认单位就是dp(独立密度像素)，对于iphone6来说尺寸就是375dp * 667dp, 这点和在h5开发时设置px的结果（375px * 667px）很像。

#### 如何设置样式
样式的设置方式有两种，一种是内嵌方式， 另一种方式是引用样式对象

```javascript
内嵌样式

	<Text style={{color: '#fff', alignSelf: 'stretch'}}>消息</Text>

引用样式

	import {StyleSheet} 
	const styles = StyleSheet.create({
	  whiteText:{
	    color: '#fff',
	    alignSelf: 'stretch'
	  }
	});
	// 组件内容
	<Text style={styles.whiteText}>消息</Text> 其中styles.whiteText的类型可以是数组也可以是对象。
```

#### flexbox布局
react native的基础布局方式是flexbox布局。不明白什么是flexbox布局的可以参照[这个教程](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)。其中需要注意的是：

- flexDirection 的默认值是column而不是row. 取值范围有`column`, `row`.
- justifyContent的默认值仍然是flex-start。取值范围有`flex-start`、`center`、`flex-end`、`space-around`以及`space-between`.
- alignItems的默认值是stretch而不是flex-start。取值范围有flex-start、center、flex-end以及stretch。
- 没有flex-shrink和flex-grow，空间位置的分配全靠flex: [number]的属性值来进行比例分配。

#### 布局常用样式对比
- `display` 可以认为View和View下的所有子组件都是block布局。但是需要注意的是Text内部采用的文本布局方式，即Text的下的所有Text文本是前后连接并存在折行的。
- `position` 很高兴position: absolute和position:relative还存在并且能力未失，left，top,right,bottom还在。总体来看position布局能力大大地削弱了
- `margin`  现在用于margin布局的属性有 marginBottom、 marginLeft、 marginRight、marginTop、marginVertical、marginHorizontal、margin。每个属性都只能设置一个值，其中marginVertical设置的是垂直方向的值，代表marginTop和marginBottom的值，marginHorizontal和margin同理。在文本布局中padding和margin都是无效的。
- `padding` 在文本布局中padding和margin都是无效的。属性和margin同理。
  
#### 水平垂直居中
原理就是利用flex布局的元素水平居中和垂直居中来实现。

```
<View style={{height: 100, backgroundColor: '#89A236', justifyContent: 'center', alignItems: 'center'}}>
    <View style={{backgroundColor:'yellow', height: 50,width: 200}}></View>
</View>
		
```  
#### 浮动
由于绝对布局的方式没有变化，可以通过position: absolute布局来进行模拟浮动。


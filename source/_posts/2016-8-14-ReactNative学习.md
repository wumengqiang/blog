---
layout: post
title: 前端工具 
tags:
- React Native
categories: 学习 
description: 学习React Native的一些知识, 方便查找
---


- StyleSheet为样式控制器， 可以采用StyleSheet.create(obj)来创建样式，从而实现样式的管理，至于样式的使用与React相一致，obj内容样例如下

```javascript

<Text style={styles.bigblue}>just bigblue</Text>

const styles = StyleSheet.create({ 
  bigblue: { 
    color: 'blue',
    fontWeight: 'bold',
    fontSize: 30,
  },
  red: {
    color: 'red',
  },
});
```

- 在组件样式中使用flex可以使其在可利用的空间中动态地扩张或收缩。一般而言我们会使用flex:1来指定某个组件扩张以撑满所有剩余的空间。(不需要设置display: flex)

- 组件能够撑满剩余空间的前提是其父容器的尺寸不为零。如果父容器既没有固定的width和height，也没有设定flex，则父容器的尺寸为零。其子组件如果使用了flex，也是无法显示的。

- 网络请求 fetch api

### 组件
- Text 文本组件
- TextInput 有两个事件属性onChangeText（此函数会在文本变化时被调用）和onSubmitEditing（文本被提交后调用，即用户按下软键盘上的提交键）。
- ScrollView 可水平垂直滚动的容器。
- ListView组件用于显示一个垂直的滚动列表，其中的元素之间结构近似而仅数据不同。ListView并不立即渲染所有元素，而是优先渲染屏幕上可见的元素。ListView组件必须的两个属性是dataSource和renderRow。dataSource是列表的数据源，而renderRow则逐个解析数据源中的数据，然后返回一个设定好格式的组件来渲染。


### RCTRootView
RCTRootView 用来将react native组件封装到原生view中. 当在index.ios.js中写好组件后，需要将组件添加到一个ViewController中，其中最简单的方式是创建一个event path到组件中并把该组件添加到ViewController中。

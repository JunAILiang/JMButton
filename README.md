# JMButton
超强UIButton封装
* 自定义图片上下左右位置
* 自定义文字和图片间距
* 自定义角标动画
* 支持CocoaPods

# 一张图让你看懂JMButton结构
![](https://github.com/JunAILiang/JMButton/raw/master/JMButton/gif/JMButtonAll.png)

# 版本
* 2018-01-17 新增自定义View, 新增倒计时功能  
* 2018-01-16 初始版本

# 演示
![](https://github.com/JunAILiang/JMButton/raw/master/JMButton/gif/JMButton1.gif) ![](https://github.com/JunAILiang/JMButton/raw/master/JMButton/gif/JMButton2.gif) ![](https://github.com/JunAILiang/JMButton/raw/master/JMButton/gif/JMButton3.gif)

# 如何使用, 以Bootstrap样式为例
* 通过CocoaPods导入 `pod 'JMButton', '~> 0.1'`
* 手动导入 直接下载工程把 `JMButton` 文件夹导入到自己工程中
1. 导入JMButton`#import "JMButton.h"`，
2. 初始化JMBootstrapButtonConfig并配置属性
```
JMBootstrapButtonConfig *buttonConfig = [JMBootstrapButtonConfig buttonConfig];
buttonConfig.bootstrapType = JMBootstrapTypeDefault;
```
3. 初始化JMButton并添加到视图
```
JMButton *btn = [[JMButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50) ButtonConfig:buttonConfig];
[btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
[self.view addSubView:btn];
```

### 联系我:
   * qq: 1245424073
   * [简书地址](https://www.jianshu.com/p/ba8e986cdd0c)
   * [我的博客](https://ljmvip.cn)

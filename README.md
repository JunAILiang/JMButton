# JMButton
超强UIButton封装
* 新增水波纹按钮点击效果
* 新增倒计时功能
* 新增高度自定义计数器功能
* 自定义图片上下左右位置
* 自定义文字和图片间距
* 自定义角标动画
* 支持CocoaPods

# 一张图让你看懂JMButton结构
![](https://github.com/JunAILiang/JMAllGif/raw/master/JMButton/JMButtonAll.png)

# 版本
* 2018-01-29 修复按钮倒计时功能
* 2018-01-26 新增水波纹点击效果
* 2018-01-22 新增计数器功能 (仿淘宝, 京东, 美团, 饿了吗, 百度外卖 计数功能)
* 2018-01-17 新增自定义View, 新增倒计时功能  
* 2018-01-16 初始版本

# 演示
![](https://github.com/JunAILiang/JMAllGif/raw/master/JMButton/JMButton.gif) ![](https://github.com/JunAILiang/JMAllGif/raw/master/JMButton/JMButton1.gif) ![](https://github.com/JunAILiang/JMAllGif/raw/master/JMButton/JMButton2.gif)

# 基本按钮如何使用, 以Bootstrap样式为例
* 通过CocoaPods导入 `pod 'JMButton', '~> 0.5'`
* 手动导入 直接下载工程把 `JMButton` 文件夹导入到自己工程中
1. 导入JMButtons`#import "JMButtons.h"`，
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

# 一行代码实现倒计时按钮
```
//一行代码实现倒计时
[bsBtn startCountDown:6];
```

### 倒计时其他属性
```
/** 倒计时中背景颜色(默认 不设置) */
@property (nonatomic, strong) UIColor *countDownBackground;
/** 倒计时完成后背景颜色 (默认 不设置) */
@property (nonatomic, strong) UIColor *countDownDoneBackground;
/** 倒计时边框颜色 (默认 不设置) */
@property (nonatomic, strong) UIColor *countDownBorderColor;
/** 倒计时完成后边框颜色 (默认 不设置) */
@property (nonatomic, strong) UIColor *countDownDoneBorderColor;
```

# 计数器按钮如何使用
1. 导入JMButtons`#import "JMButtons.h"`
```
JMNumberButtonConfig *buttonConfig = [JMNumberButtonConfig buttonConfig];
buttonConfig.shakeAnimation = YES; //开启抖动动画
JMNumberButton *numberBtn = [[JMNumberButton alloc] initWithFrame:CGRectMake(50, 100, 120, 40) NumberButtonConfig:buttonConfig];
[self.view addSubview:numberBtn];
```

### 计数器按钮高自定义
```
typedef NS_ENUM(NSInteger, JMNumberButtonType) {
    JMNumberButtonTypeNormal,  //默认样式
    JMNumberButtonTypeTaoBao,  //仿淘宝样式
    JMNumberButtonTypeJingDong, //仿京东样式
    JMNumberButtonTypeMeiTuan,  //仿美团 饿了吗 百度外卖 样式
};

@interface JMNumberButtonConfig : NSObject

/** 初始化 */
+ (instancetype)buttonConfig;

/********************* 样式配置 *********************/
/** 样式 */
@property (nonatomic, assign) JMNumberButtonType numberButtonType;
/** 是否开启抖动动画 (默认 NO) */
@property (nonatomic, assign) BOOL shakeAnimation;


/********************* 输入框配置 *********************/
/** 输入框中的内容 (默认 1) */
@property (nonatomic, assign) NSInteger currentNumber;
/** 输入框中字体大小 (默认 20.f )*/
@property (nonatomic, strong) UIFont *inputFont;
/** 输入框是否可输入 (默认 YES) */
@property (nonatomic, assign) BOOL isInput;
/** 边框线条宽度 (默认 0  0的话不会展示) */
@property (nonatomic, assign) CGFloat borderLineWidth;
/** 边框线条颜色 (默认 #eeeeee) */
@property (nonatomic, strong) UIColor *borderLineColor;
/** 圆角值 ( 默认 3.f  如果设置了numberButtonType, 圆角值将无效 ) */
@property (nonatomic, assign) CGFloat cornerRadius;


/********************* 按钮配置 *********************/
/** 加减按钮字体大小 (默认 30.f) */
@property (nonatomic, strong) UIFont *buttonTitleFont;
/** 加按钮背景颜色 (默认 #FFFFFF) */
@property (nonatomic, strong) UIColor *increaseBackgroundColor;
/** 减按钮背景颜色 (默认 #FFFFFF)*/
@property (nonatomic, strong) UIColor *decreaseBackgroundColor;
/** 加按钮背景图片 (默认 nil  图片的设置优先级高于背景颜色) */
@property (nonatomic, strong) UIImage *increaseBackgroundImage;
/** 减按钮背景图片 (默认 nil) */
@property (nonatomic, strong) UIImage *decreaseBackgroundImage;
/** 加按钮标题 (默认 +) */
@property (nonatomic, strong) NSString *increaseTitle;
/** 减按钮标题 (默认 -) */
@property (nonatomic, strong) NSString *decreaseTitle;
/** 加按钮contentEdgeInsets (默认 0, 0, 3, 0) */
@property (nonatomic, assign) UIEdgeInsets increaseContentEdgeInsets;
/** 减按钮contentEdgeInsets (默认 0, 0, 3, 0) */
@property (nonatomic, assign) UIEdgeInsets decreaseContentEdgeInsets;


/********************* 其他配置 *********************/
/** 最小值 (默认 1)*/
@property (nonatomic, assign) NSInteger minNumber;
/** 最大值 (默认 无限制)*/
@property (nonatomic, assign) NSInteger maxNumber;
```

# 水波纹按钮如何使用
1. 导入JMButtons`#import "JMButtons.h"`
```
JMWaveButtonConfig *buttonConfig = [JMWaveButtonConfig buttonConfig];
buttonConfig.highlightedColor = [UIColor redColor];  //水波纹按钮颜色
buttonConfig.title = @"我是按钮1";
JMButton *waveBtn = [[JMButton alloc] initWithFrame:CGRectMake(50, 100, 160, 60) ButtonConfig:buttonConfig];
[self.view addSubview:waveBtn];
```


### 联系我:
   * qq: 1245424073
   * [简书地址](https://www.jianshu.com/p/ba8e986cdd0c)
   * [我的博客](https://ljmvip.cn)

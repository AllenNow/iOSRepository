Don't trouble trouble until trouble troubles you.
不要自寻烦恼。​
```sequence
Swift->iOS: Says Hello
iOS-->Swift: How are you?
```

###一、Attributes字典键值对照表

| 键        | 值类型   |  备注  |
| --------   | -----:  | :----:  |
| NSKernAttributeName(文字间距)| NSNumber|   支持浮点型     
| NSFontAttributeName(字体)|   UIFont   |      |
| NSForegroundColorAttributeName(字体颜色)| UIColor|   |
|NSParagraphStyleAttributeName(段落样式)|NSMutableParagraphStyle|详细见【1】
|NSBackgroundColorAttributeName(背景颜色)|UIColor|字体的所占区域的背景颜色
|NSStrokeColorAttributeName（字体边框的颜色）|UIColor|
|NSStrokeWidthAttribute（字体边框的宽度）|NSNumber|负数描边，正数空心，空心前景色失效
|NSStrikethroughStyleAttributeName（删除线）||`NSStrikethroughStyleAttributeName:@{NSUnderlineStyleSingle},`
|NSUnderlineStyleAttributeName（下划线）||`NSUnderlineStyleAttributeName:@{NSUnderlineStyleSingle}`
|NSVerticalGlyphFormAttributeName(文字排版方向)|NSNumber|0 表示横排文本.1 表示竖排文本
|NSObliquenessAttributeName(文字倾斜)|NSNumber|倾斜程度`NSObliquenessAttributeName: @5,`
|NSExpansionAttributeName(文字扁平化)|NSNumber|文字的扁平化程度
|NSShadowAttributeName(文字阴影)|NSShadow|见【2】
【1】NSMutableParagraphStyle类使用范例

```
NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
paragraphStyle.lineSpacing = 10;// 字体的行间距
paragraphStyle.firstLineHeadIndent = 20.0f;//首行缩进
paragraphStyle.alignment = NSTextAlignmentJustified;//（两端对齐的）文本对齐方式：（左，中，右，两端对齐，自然）
paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;//结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")
paragraphStyle.headIndent = 20;//整体缩进(首行除外)
paragraphStyle.tailIndent = 20;//尾部缩进
paragraphStyle.minimumLineHeight = 10;//最低行高
paragraphStyle.maximumLineHeight = 20;//最大行高
paragraphStyle.paragraphSpacing = 15;//段与段之间的间距
paragraphStyle.paragraphSpacingBefore = 22.0f;//段首行空白空间/* Distance between the bottom of the previous paragraph (or the end of its paragraphSpacing, if any) and the top of this paragraph. */paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;//从左到右的书写方向（一共➡️⬇️⬅️三种）
paragraphStyle.lineHeightMultiple = 15;/* Natural line height is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. */
paragraphStyle.hyphenationFactor = 1;//连字属性 在iOS，唯一支持的值分别为0和1
```

【2】NSShadowAttributeName对应的是NSShadow对象,单一使用不会有任何效果,需要配合着NSVerticalGlyphFormAttributeName(文字排版方向)、NSObliquenessAttributeName(文字倾斜)、NSExpansionAttributeName(文字扁平化)配合使用,NSShadow相关属性设置如下所示.

```
NSShadow *shadow = [[NSShadow alloc]init];
shadow.shadowBlurRadius = 5;//模糊度
shadow.shadowColor = [UIColor whiteColor];//阴影颜色
shadow.shadowOffset = CGSizeMake(1, 5);//阴影的大小
```

### 二、 NSAttributedString与NSMutableAttributedString
1.NSAttributedString
属性

```
//均为只读
@property (readonly, copy) NSString *string;
@property (readonly) NSUInteger length;
```

创建方法

```
- (instancetype)initWithString:(NSString *)str;
- (instancetype)initWithAttributedString:(NSAttributedString *)attrStr;
- (instancetype)initWithString:(NSString *)str attributes:(nullable NSDictionary<NSString *, id> *)attrs;
```
其他方法

```
//富文本字符串比较
- (BOOL)isEqualToAttributedString:(NSAttributedString *)other;
```



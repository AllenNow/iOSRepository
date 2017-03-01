//
//  STAttributeStringVC.m
//  iOSRepository
//
//  Created by Swift Gao on 2017/2/19.
//  Copyright © 2017年 Swift Gao. All rights reserved.
//

#import "STAttributeStringVC.h"
#import "STMarkdownVC.h"
@interface STAttributeStringVC ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label8;

@end

@implementation STAttributeStringVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpLabel1];
    [self setUpLabel2];
    [self setUpLabel3];
    [self setUpLabel4];
    [self setUpLabel5];
    [self setUpLabel6];
    [self setUpLabel7];
    [self setUpLabel8];
}

- (void)setUpLabel1{
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"改变文字间距,间距为6"attributes:@{NSKernAttributeName:@6}];
    _label1.attributedText = string;
    
}
- (void)setUpLabel2{
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"改变文字字体,20号粗体"attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20]}];
    _label2.attributedText = string;
}
- (void)setUpLabel3{
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"改变文字颜色,绿色"attributes:@{NSForegroundColorAttributeName:[UIColor greenColor]}];
    _label3.attributedText = string;
}
- (void)setUpLabel4{
    NSMutableAttributedString *mutableAttributedstring = [[NSMutableAttributedString alloc] initWithString:@"改变文字边框颜色宽度,这两者协同使用才有效果，宽度正数为空心（前景色失效），负数描边"];
    //空心
    [mutableAttributedstring addAttribute:NSStrokeWidthAttributeName value:@3.2 range:NSMakeRange(0, 37)];
    [mutableAttributedstring addAttribute:NSStrokeColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, 37)];
    
    //描边
    [mutableAttributedstring addAttribute:NSStrokeWidthAttributeName value:@-5 range:NSMakeRange(38, mutableAttributedstring.length - 38)];
    [mutableAttributedstring addAttribute:NSStrokeColorAttributeName value:[UIColor redColor] range:NSMakeRange(38, mutableAttributedstring.length - 38)];
    _label4.numberOfLines = 3;
    _label4.attributedText = mutableAttributedstring;
}

//删除线
- (void)setUpLabel5{
    NSMutableAttributedString *mutableAttributedstring = [[NSMutableAttributedString alloc] initWithString:@"一条删除线，两条删除线，加粗删除线"];
    [mutableAttributedstring addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0,5)];
    [mutableAttributedstring addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleDouble] range:NSMakeRange(6,5)];
    [mutableAttributedstring addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleThick] range:NSMakeRange(12,5)];
    _label5.attributedText = mutableAttributedstring;
}

//下划线
- (void)setUpLabel6{
    NSMutableAttributedString *mutableAttributedstring = [[NSMutableAttributedString alloc] initWithString:@"一条下划线，两条下划线，加粗下划线"];
    [mutableAttributedstring addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0,5)];
    [mutableAttributedstring addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleDouble] range:NSMakeRange(6,5)];
    [mutableAttributedstring addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleThick] range:NSMakeRange(12,5)];
    _label6.attributedText = mutableAttributedstring;
}

//文字倾斜，阴影，压扁文字
- (void)setUpLabel7{
    NSMutableAttributedString *mutableAttributedstring = [[NSMutableAttributedString alloc] initWithString:@"文字倾斜，文字阴影，压扁文字"];
    [mutableAttributedstring addAttribute:NSObliquenessAttributeName value:@1 range:NSMakeRange(0,4)];
    
    //文字阴影
    NSShadow *shadow = [[NSShadow alloc] init];
    //模糊度
    shadow.shadowBlurRadius = 5;
    //阴影颜色
    shadow.shadowColor = [UIColor yellowColor];
    //阴影大小
    shadow.shadowOffset = CGSizeMake(2, 5);
    [mutableAttributedstring addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(5,4)];
    
    //压扁文字
    [mutableAttributedstring addAttribute:NSExpansionAttributeName value:@0.8 range:NSMakeRange(10,4)];
    _label7.numberOfLines = 2;
     _label7.attributedText = mutableAttributedstring;
    
}
- (void)setUpLabel8{
    NSMutableAttributedString *mutableAttributedstring = [[NSMutableAttributedString alloc] initWithString:@"据外媒报道，美国太空探索技术公司SpaceX原定于北京时间2月18日23时01分，在佛罗里达州发射“龙”无人货运飞船，运送补给物资前往国际太空站，并尝试回收搭载飞船的“猎鹰9”号火箭。但二级火箭在倒计时13秒时因引擎故障，宣布取消发射。\n在发射暂停后约10分钟后，SpaceX首席执行官埃隆·马斯克(Elon Musk)在社交媒体上发布消息称：“一切运行正常，除了二级火箭发动机转向液压活塞的运动轨迹稍显奇怪，需要进行调查。”"];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 字体的行间距
    paragraphStyle.lineSpacing = 10;
    //首行缩进
    paragraphStyle.firstLineHeadIndent = 20.0f;
    //（两端对齐的）文本对齐方式：（左，中，右，两端对齐，自然）
//    paragraphStyle.alignment = NSTextAlignmentLeft;
    //结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")
//    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.headIndent = 20;//整体缩进(首行除外)
    //设置尾部缩进后就出问题
//    paragraphStyle.tailIndent = 2;//尾部缩进
    paragraphStyle.minimumLineHeight = 10;//最低行高
    paragraphStyle.maximumLineHeight = 20;//最大行高
//    paragraphStyle.paragraphSpacing = 15;//段与段之间的间距
    paragraphStyle.paragraphSpacingBefore = 22.0f;//段首行空白空间/* Distance between the bottom of the previous paragraph (or the end of its paragraphSpacing, if any) and the top of this paragraph. */
    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;//从左到右的书写方向（一共➡️⬇️⬅️三种）
    
    paragraphStyle.lineHeightMultiple = 15;/* Natural line height is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. */
    paragraphStyle.hyphenationFactor = 1;//连字属性 在iOS，唯一支持的值分别为0和1
    
    [mutableAttributedstring addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, mutableAttributedstring.length)];
    [mutableAttributedstring addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:NSMakeRange(0, mutableAttributedstring.length)];
    _label8.numberOfLines = MAXFLOAT;
    _label8.attributedText = mutableAttributedstring;
    
}

- (IBAction)btnAction {
    STMarkdownVC *markdownVC = [[STMarkdownVC alloc]init];
    markdownVC.filePath = @"structure/Media/Text/AttributeText";
    markdownVC.title = @"AttributeString";
    [self.navigationController pushViewController:markdownVC animated:YES];
}

@end

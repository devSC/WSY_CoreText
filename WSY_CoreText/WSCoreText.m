//
//  WSCoreText.m
//  WSY_CoreText
//
//  Created by Wilson-Yuan on 15/7/15.
//  Copyright (c) 2015年 wilson-yuan. All rights reserved.
//
#import <CoreText/CoreText.h>
#import "WSCoreText.h"

@implementation WSCoreText

//http://www.zoomfeng.com/blog/coretextshi-yong-jiao-cheng-er.html
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    //2. 转换坐标
    CGContextSetTextMatrix(contextRef, CGAffineTransformIdentity);
    
    //way 1:
    CGContextConcatCTM(contextRef, CGAffineTransformMake(1, 0, 0, -1, 0, self.bounds.size.height));
    //way 2:
        //    CGContextTranslateCTM(contextRef, 0, self.bounds.size.height);
        //    CGContextScaleCTM(contextRef, 1.0, -1.0);
    

    //3. 创建绘制区域
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    //4.创建需要绘制的文字
    
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:@"Google 为了拯救程序员人类，特意发布了一套精美的 Material Design Icons 扁平化简约风格黑白纯色图标集！这里面包含了近千枚各种类型的图标，覆盖了 APP、网站等日常设计中需要用到大部分类型。无论你是开发者还是设计师，这套简约的谷歌图标都值得你收藏备用……"];
    
    [attributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 5)];
    
    [attributed addAttribute:NSForegroundColorAttributeName value:[UIColor cyanColor] range:NSMakeRange(4, 20)];
    [attributed addAttribute:(id)kCTForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(6, 10)];
    
    //设置行距等模式
    CGFloat lineSpace = 10; //行间距
    
    CGFloat lineSpaceMax = 20;
    CGFloat lineSpaceMin = 2;
    
    const CFIndex kNumberOfSettings = 3;
    
    //结构体数据
    CTParagraphStyleSetting theSettings[kNumberOfSettings] = {
        {kCTParagraphStyleSpecifierLineSpacingAdjustment, sizeof(CGFloat), &lineSpace},
        {kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(CGFloat), &lineSpaceMax},
        {kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(CGFloat), &lineSpaceMin},
    };
    CTParagraphStyleRef theParagrphRef = CTParagraphStyleCreate(theSettings, kNumberOfSettings);
    
    //单个元素的形式
    // CTParagraphStyleSetting theSettings = {kCTParagraphStyleSpecifierLineSpacingAdjustment,sizeof(CGFloat),&lineSpace};
    // CTParagraphStyleRef theParagraphRef = CTParagraphStyleCreate(&theSettings, kNumberOfSettings);
    
    // 两种方式皆可
    // [attributed addAttribute:(id)kCTParagraphStyleAttributeName value:(__bridge id)theParagraphRef range:NSMakeRange(0, attributed.length)];

    //4. 将设置的行间距应用于整段文字
    
    [attributed addAttribute:NSParagraphStyleAttributeName value:(__bridge id)(theParagrphRef) range:NSMakeRange(0, attributed.length)];
    
    CFRelease(theParagrphRef);
    
    //5. 根据NSAttributedString生成CTFrameSetterRef
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributed);
    
    CTFrameRef ctFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attributed.length), path, NULL);
    
    //6. 绘制除图片以外的部分
    
    CTFrameDraw(ctFrame, contextRef);
    
    //7.内存管理
    CFRelease(path);
    CFRelease(framesetter);
    CFRelease(ctFrame);
    
    
//    // 1.获取上下文
//    CGContextRef contextRef = UIGraphicsGetCurrentContext();
//    
//    // [a,b,c,d,tx,ty]
//    NSLog(@"转换前的坐标：%@",NSStringFromCGAffineTransform(CGContextGetCTM(contextRef)));
//    
//    // 2.转换坐标系,CoreText的原点在左下角，UIKit原点在左上角
//    CGContextSetTextMatrix(contextRef, CGAffineTransformIdentity);
//    
//    // 这两种转换坐标的方式效果一样
//    // 2.1
//    // CGContextTranslateCTM(contextRef, 0, self.bounds.size.height);
//    // CGContextScaleCTM(contextRef, 1.0, -1.0);
//    
//    // 2.2
//    CGContextConcatCTM(contextRef, CGAffineTransformMake(1, 0, 0, -1, 0, self.bounds.size.height));
//    
//    NSLog(@"转换后的坐标：%@",NSStringFromCGAffineTransform(CGContextGetCTM(contextRef)));
//    
//    
//    // 3.创建绘制区域，可以对path进行个性化裁剪以改变显示区域
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, self.bounds);
//    // CGPathAddEllipseInRect(path, NULL, self.bounds);
//    
//    // 4.创建需要绘制的文字
//    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:@"Google 为了拯救程序员人类，特意发布了一套精美的 Material Design Icons 扁平化简约风格黑白纯色图标集！这里面包含了近千枚各种类型的图标，覆盖了 APP、网站等日常设计中需要用到大部分类型。无论你是开发者还是设计师，这套简约的谷歌图标都值得你收藏备用……"];
//    
//    [attributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 5)];
//    
//    // 两种方式皆可
//    [attributed addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(3, 10)];
//    [attributed addAttribute:(id)kCTForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, 2)];
//    
//    // 设置行距等样式
//    CGFloat lineSpace = 10; // 行距一般取决于这个值
//    CGFloat lineSpaceMax = 20;
//    CGFloat lineSpaceMin = 2;
//    const CFIndex kNumberOfSettings = 3;
//    
//    // 结构体数组
//    CTParagraphStyleSetting theSettings[kNumberOfSettings] = {
//        
//        {kCTParagraphStyleSpecifierLineSpacingAdjustment,sizeof(CGFloat),&lineSpace},
//        {kCTParagraphStyleSpecifierMaximumLineSpacing,sizeof(CGFloat),&lineSpaceMax},
//        {kCTParagraphStyleSpecifierMinimumLineSpacing,sizeof(CGFloat),&lineSpaceMin}
//        
//    };
//    CTParagraphStyleRef theParagraphRef = CTParagraphStyleCreate(theSettings, kNumberOfSettings);
//    
//    // 单个元素的形式
//    // CTParagraphStyleSetting theSettings = {kCTParagraphStyleSpecifierLineSpacingAdjustment,sizeof(CGFloat),&lineSpace};
//    // CTParagraphStyleRef theParagraphRef = CTParagraphStyleCreate(&theSettings, kNumberOfSettings);
//    
//    // 两种方式皆可
//    // [attributed addAttribute:(id)kCTParagraphStyleAttributeName value:(__bridge id)theParagraphRef range:NSMakeRange(0, attributed.length)];
//    
//    // 将设置的行距应用于整段文字
//    [attributed addAttribute:NSParagraphStyleAttributeName value:(__bridge id)(theParagraphRef) range:NSMakeRange(0, attributed.length)];
//    
//    CFRelease(theParagraphRef);
//    
//    
//    // 5.根据NSAttributedString生成CTFramesetterRef
//    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributed);
//    
//    CTFrameRef ctFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attributed.length), path, NULL);
//    
//    // 6.绘制除图片以外的部分
//    CTFrameDraw(ctFrame, contextRef);
//    
//    
//    // 7.内存管理，ARC不能管理CF开头的对象，需要我们自己手动释放内存
//    CFRelease(path);
//    CFRelease(framesetter);
//    CFRelease(ctFrame);
}
@end

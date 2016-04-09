//
//  WSCoreText.m
//  WSY_CoreText
//
//  Created by Wilson-Yuan on 15/7/15.
//  Copyright (c) 2015年 wilson-yuan. All rights reserved.
//
#import <CoreText/CoreText.h>
#import "WSCoreText.h"

@implementation WSCoreText {
    UIImage *localImage;
}

//http://www.zoomfeng.com/blog/coretextshi-yong-jiao-cheng-er.html
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    /*--------------------------------1-------------------------------------*/

/*
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
    CGFloat lineSpace = 5; //行间距
    
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
    
    //调整字间距
    long number = 4;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    [attributed addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0,[attributed length])];
    CFRelease(num);
    
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
 
 */
    
/*--------------------------------2-------------------------------------*/
    
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
    
    /*--------------------------------3-------------------------------------*/
//    //1: 获取当前上下文
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    //2: 翻转坐标系
//    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
//    CGContextTranslateCTM(context, 0, self.bounds.size.height);
//    CGContextScaleCTM(context, 1.0, -1.0);
//    //3: 创建绘制区域
//    CGMutablePathRef path = CGPathCreateMutable();
////    CGPathAddEllipseInRect(path, NULL, self.bounds);
//    CGPathAddRect(path, NULL, self.bounds);
//    //4: 创建需要绘制的文字
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"手工客->中国最大的手工兴趣社区\n 手工客是一款手工学习神器，手工爱好者必备应用，手工客网倾力打造。聚集了国内众多的手工艺人和手工爱好者，是一个学习手工和分享手工作品的互动社区。"];
//    
//    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Avenir Light" size:15] range:NSMakeRange(0, 3)];
//    
//    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(5, 2)];
//    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Avenir Light" size:22] range:NSMakeRange(20, 7)];
//
//    //4.1 调整各种属性和自定义排版
//    CGFloat lineSpace = 0; //行间距
//    CGFloat lineSpaceMax = 5; //最大行间距 //如果文字中间有
//    CGFloat lineSpaceMin = 1; //最小行间距
//    
//    const CFIndex numberOfStyleSetting = 3;
//    CTParagraphStyleSetting theSetting[numberOfStyleSetting] = {
//        {kCTParagraphStyleSpecifierLineSpacingAdjustment, sizeof(CGFloat), &lineSpace},
//        {kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(CGFloat), &lineSpaceMax},
//        {kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(CGFloat), &lineSpaceMin},
////        {kCTParagraphStyleSpecifierLineSpacing, sizeof(CGFloat), &lineSpace},
//    };
//    CTParagraphStyleRef paragraphStyle = CTParagraphStyleCreate(theSetting, numberOfStyleSetting);
//    //4.1.1将设置的行样式应用到字段
//    [attributedString addAttribute:(id)kCTParagraphStyleAttributeName value:(__bridge id)paragraphStyle range:NSMakeRange(0, attributedString.length)];
//
//    //4.2调整字间距
//    long kerningNumber = 1;
//    CFNumberRef numberRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &kerningNumber);
//    [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)numberRef range:NSMakeRange(0, [attributedString length])];
//    
//    //5: 根据string生成CTFramesetterRef
//    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributedString);
//    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, [attributedString length]), path, NULL);
//    //6: 进行绘制
//    CTFrameDraw(frame, context);
//    //7: 内存管理 ARC不能管理CF开头的对象
//    CFRelease(frame);
//    CFRelease(paragraphStyle);
//    CFRelease(numberRef);
//    CFRelease(path);
//    CFRelease(frameSetter);
    
    
    /*--------------------------------4-------------------------------------*/
    static NSString *KImageNameKey = @"imageName";
    
    //1: 获取当前上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2: 翻转坐标系
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    //3: 创建绘制区域
    CGMutablePathRef path = CGPathCreateMutable();
    //    CGPathAddEllipseInRect(path, NULL, self.bounds);
    CGPathAddRect(path, NULL, self.bounds);
    //4: 创建需要绘制的文字
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"手工客->中国最大的手工兴趣社区\n 手工客是一款手工学习神器，手工爱好者必备应用，手工客网倾力打造。聚集了国内众多的手工艺人和手工爱好者，是一个学习手工和分享手工作品的互动社区。"];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Avenir Light" size:15] range:NSMakeRange(0, 3)];
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(5, 2)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Avenir Light" size:22] range:NSMakeRange(20, 7)];
    
    //4.1 调整各种属性和自定义排版
    CGFloat lineSpace = 0; //行间距
    CGFloat lineSpaceMax = 5; //最大行间距 //如果文字中间有
    CGFloat lineSpaceMin = 1; //最小行间距
    
    const CFIndex numberOfStyleSetting = 3;
    CTParagraphStyleSetting theSetting[numberOfStyleSetting] = {
        {kCTParagraphStyleSpecifierLineSpacingAdjustment, sizeof(CGFloat), &lineSpace},
        {kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(CGFloat), &lineSpaceMax},
        {kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(CGFloat), &lineSpaceMin},
        //        {kCTParagraphStyleSpecifierLineSpacing, sizeof(CGFloat), &lineSpace},
    };
    CTParagraphStyleRef paragraphStyle = CTParagraphStyleCreate(theSetting, numberOfStyleSetting);
    //4.1.1将设置的行样式应用到字段
    [attributedString addAttribute:(id)kCTParagraphStyleAttributeName value:(__bridge id)paragraphStyle range:NSMakeRange(0, attributedString.length)];
    
    //4.2调整字间距
    long kerningNumber = 1;
    CFNumberRef numberRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &kerningNumber);
    [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)numberRef range:NSMakeRange(0, [attributedString length])];
    
    
    //4.3插入图片
    //CTRunDelegateCallbacks 一个用于保存指针的结构体， 由CTRun delegate进行回调
    CTRunDelegateCallbacks callBacks;
//    memset(&callBacks, 0, sizeof(CTRunDelegateCallbacks));
    callBacks.version = kCTRunDelegateVersion1;
    callBacks.dealloc = RunDelegateDeallocCallBack;
    callBacks.getAscent = RunDelegateGetAscentCallBack;
    callBacks.getDescent = RunDelegateGetDescentCallBack;
    callBacks.getWidth = RunDelegateGetWidthCallBack;
    
    //图片信息
    {
        NSString *imageName = @"heart"; //本地图片
        
        //设置CTRunDelegate
        CTRunDelegateRef delegate = CTRunDelegateCreate(&callBacks, (__bridge void *)imageName);
        
        //使用OxFFC作为空白的展位符
//        unichar objectReplacementChar = 0xFFFC; //图片占位
//        NSString *content = [NSString stringWithCharacters:&objectReplacementChar length:1];
        NSMutableAttributedString *space = [[NSMutableAttributedString alloc] initWithString:@" "];
        //本地图片
        [space addAttribute:(NSString *)kCTRunDelegateAttributeName value:(__bridge id)delegate range:NSMakeRange(0, 1)]; //设置代理项
        CFRelease(delegate);
        
        [space addAttribute:KImageNameKey value:imageName range:NSMakeRange(0, 1)];
        
        //将创建的空白attributedString插入当前的attributeString中，位置任意，但不能越界
        [attributedString insertAttributedString:space atIndex:10];
        

    }
    
    NSString *picUrl = @"http://www.zoomfeng.com/images/2015/05/27/CoreText_3.png";
    
//    {
        NSDictionary *imageInfo = @{@"width" : @330, @"height" : @204};
        
        CTRunDelegateRef rundelegate = CTRunDelegateCreate(&callBacks, (__bridge void *)imageInfo);
        
        unichar objectReplacementChar = 0xFFFC;
        NSString *content = [NSString stringWithCharacters:&objectReplacementChar length:1];
        
        NSMutableAttributedString *space = [[NSMutableAttributedString alloc] initWithString:content];
        
        [space addAttribute:(NSString *)kCTRunDelegateAttributeName value:(__bridge id)rundelegate range:NSMakeRange(0, 1)];
        
        CFRelease(rundelegate);
        
        [attributedString insertAttributedString:space atIndex:20];
//
//    }

    
    //5: 根据string生成CTFramesetterRef
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributedString);
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, [attributedString length]), path, NULL);
    //6: 绘制图片以外部分
    CTFrameDraw(frame, context);
    
    //
    CFArrayRef lines = CTFrameGetLines(frame);
    CGPoint lineOrigins[CFArrayGetCount(lines)];
    //把ctframe里每一行的初始坐标写到数组里
    CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), lineOrigins);
    
    //便利CTRun找出图片所在的CTRun并进行绘制
    for (int i = 0; i < CFArrayGetCount(lines); i++) {
        //遍历每一行CTLine
        CTLineRef line = CFArrayGetValueAtIndex(lines, i);
        CGFloat lineAscent;
        CGFloat lineDscent;
        CGFloat lineLeading; //行距
        CTLineGetTypographicBounds(line, &lineAscent, &lineDscent, &lineLeading);
        
        CFArrayRef runs = CTLineGetGlyphRuns(line);
        for (int j = 0; j < CFArrayGetCount(runs); j++) {
            //遍历每一个CTRun CTLine中包含很多CTRun
            CGFloat runAscent;
            CGFloat runDescent;
            CGPoint lineOrigin = lineOrigins[i]; //获取改行的初始坐标
            CTRunRef run = CFArrayGetValueAtIndex(runs, j); //获取当前的CTRun
            NSDictionary *attributes = (NSDictionary *)CTRunGetAttributes(run);
            CGRect runRect;
            runRect.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &runAscent, &runDescent, NULL);
            
            // 这一段可参考Nimbus的NIAttributedLabel
            runRect = CGRectMake(lineOrigin.x + CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL), lineOrigin.y - runDescent, runRect.size.width, runAscent + runDescent);
            
            NSString *imageName = [attributes objectForKey:KImageNameKey];
            
            if ([imageName isKindOfClass:[NSString class]]) {
                //本地图片
                UIImage *image = [UIImage imageNamed:imageName];
                
                CGRect imageDrawRect;
                imageDrawRect.size = image.size;
                NSLog(@"%.2f",lineOrigin.x); // 该值是0,runRect已经计算过起始值
                imageDrawRect.origin.x = runRect.origin.x;
                imageDrawRect.origin.y = lineOrigin.y;
                CGContextDrawImage(context, imageDrawRect, image.CGImage);
            }
            else {
                imageName = nil;
                
                CTRunDelegateRef delegate = (__bridge CTRunDelegateRef)[attributes objectForKey:(__bridge id)kCTRunDelegateAttributeName];
                if (!delegate) {
                    continue; //非图片的CTRun则跳过
                }
                else {
                    //网络图
                    UIImage *image;
                    
                    if (!self->localImage) {
                        //使用占位图
                        image = [UIImage imageNamed:@"heart"]; //占位图
                        
                        [self downLoadImageWithURL:[NSURL URLWithString:picUrl]];
                    }
                    else {
                        image = self->localImage;
                    }
                    
                    //绘制网络图片
                    CGRect imageRect;
//                    imageRect.size = image.size;
                    imageRect.size = CGSizeMake(330, 204); //这里要和delegate中设置的图片大小相同 否则则会导致其他文字部分被遮挡
                    NSLog(@"%.2f",lineOrigin.x); // 该值是0,runRect已经计算过起始值
                    imageRect.origin.x = runRect.origin.x;
                    imageRect.origin.y = lineOrigin.y;
                    CGContextDrawImage(context, imageRect, image.CGImage);
                }
            }
            
            
            
        }
    }
    
    //7: 内存管理 ARC不能管理CF开头的对象
    CFRelease(frame);
    CFRelease(paragraphStyle);
    CFRelease(numberRef);
    CFRelease(path);
    CFRelease(frameSetter);
    
    /*devTQ: http://blog.devtang.com/blog/2015/06/27/using-coretext-1/*/

}

/**
 *  @brief  根据CTFrameRef获得绘制图片的区域
 *
 *  @param ctFrame CTFrameRef对象
 *
 *  @return 绘制图片的区域
 */
- (CGRect)imagePosotionInCTFrame: (CTFrameRef)ctFrame
{
    //获得CTLine数组
    NSArray *lines = (NSArray *)CTFrameGetLines(ctFrame);
    NSInteger lineCount = [lines count];
    
    CGPoint lineOrigins[lineCount];
    CTFrameGetLineOrigins(ctFrame, CFRangeMake(0, 0), lineOrigins);
    
    //遍历每个CTLine
    for (NSInteger i = 0; i < lineCount; i ++) {
        CTLineRef line = (__bridge CTLineRef)lines[i];
        NSArray *runObjArray = (NSArray *)CTLineGetGlyphRuns(line);
        
        //遍历每个CTLine中的CTRun
        for (id runObj in runObjArray) {
            CTRunRef run = (__bridge CTRunRef)runObj;
            
            NSDictionary *runAttributes = (NSDictionary *)CTRunGetAttributes(run);
            CTRunDelegateRef delegate = (__bridge CTRunDelegateRef)[runAttributes valueForKey:(id)kCTRunDelegateAttributeName];
            
            if (delegate == nil) {
                continue;
            }
            
            NSDictionary *metaDic = CTRunDelegateGetRefCon(delegate);
            
            if (![metaDic isKindOfClass:[NSDictionary class]]) {
                continue;
            }
            
            CGRect runBounds;
            CGFloat ascent;
            CGFloat descent;
            
            runBounds.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &ascent, &descent, NULL);
            runBounds.size.height = ascent + descent;
            
            CGFloat xOffset = CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL);
            runBounds.origin.x = lineOrigins[i].x + xOffset;
            runBounds.origin.y = lineOrigins[i].y;
            runBounds.origin.y -= descent;
            
            CGPathRef pathRef = CTFrameGetPath(ctFrame);
            CGRect colRect = CGPathGetBoundingBox(pathRef);
            
            CGRect delegateBounds = CGRectOffset(runBounds, colRect.origin.x, colRect.origin.y);
            return delegateBounds;
        }
    }
    return CGRectZero;
}

//static CGFloat ascentCallBack(void *ref) {
//    return [(NSNumber *)[(__bridge NSDictionary *)ref objectForKey:@"height"] floatValue];
//}
//
//static CGFloat descentCallBack(void *ref) {
//    return 0;
//}
//
//static CGFloat widthCallBack(void *ref) {
//    return [(NSNumber *)[(__bridge NSDictionary *)ref objectForKey:@"width"] floatValue];
//}

#pragma mark - Image delegate
void RunDelegateDeallocCallBack(void *refcon) {
    NSLog(@"RunDelegate dealloc");
}

CGFloat RunDelegateGetAscentCallBack(void *refCon) {
    NSString *imageName = (__bridge NSString *)refCon;
    if ([imageName isKindOfClass:[NSString class]]) {
        return [UIImage imageNamed:imageName].size.height;
    }
    else {
        return [[(__bridge NSDictionary *)refCon objectForKey:@"height"] floatValue];
    }
}


CGFloat RunDelegateGetDescentCallBack(void *refCon) {
    return 0;
}

CGFloat RunDelegateGetWidthCallBack(void *refCon) {
    NSString *name = (__bridge NSString *)refCon;
    
    if ([name isKindOfClass:[NSString class]]) {
        UIImage *image = [UIImage imageNamed:name];
        return image.size.width;
    }
    else {
        return [[(__bridge NSDictionary *)refCon objectForKey:@"width"] floatValue];
    }
}

- (void)downLoadImageWithURL:(NSURL *)url
{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:url];
            dispatch_async(dispatch_get_main_queue(), ^{
                self->localImage = [UIImage imageWithData:data];
                
                if (self->localImage)
                {
                    [self setNeedsDisplay];
                }
                
            });
        });
}



@end






























//
//  JustinLabel.m
//  MusicPlayer
//
//  Created by  justinchou on 16/3/22.
//  Copyright © 2016年  justinchou. All rights reserved.
//

#import "JustinLabel.h"

@implementation JustinLabel

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    //内容需要重绘时调用 调用drawRect方法
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    [[UIColor orangeColor] setFill];
    //蒙板模式
    UIRectFillUsingBlendMode(CGRectMake(0, 0, _progress * rect.size.width, rect.size.height), kCGBlendModeSourceIn);
}

@end

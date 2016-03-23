//
//  MusicLrcTools.m
//  MusicPlayer
//
//  Created by  justinchou on 16/3/21.
//  Copyright © 2016年  justinchou. All rights reserved.
//

#import "MusicLrcTools.h"
#import "MusicLrc.h"

@implementation MusicLrcTools

+ (NSArray *)arrayOfLrcLinesWithName:(NSString *)lrcName {
    
    NSMutableArray *resultArray = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:lrcName ofType:nil];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //使用对回车将歌词进行截取并且存入数组中
    NSArray *allLrcLines = [str componentsSeparatedByString:@"\n"];
    
    for (NSString *line in allLrcLines) {
        //1.获取所有歌词显示时间
        //[02:55.00][00:58.00]为何只是失望填密我的空虚  == line
        //正则表达式
        NSString *pattern = @"\\[[0-9][0-9]:[0-9][0-9]\\.[0-9][0-9]\\]";
        NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
        
        NSArray *allCheckingResults = [regular matchesInString:line options:NSMatchingReportCompletion range:NSMakeRange(0, line.length)];
        //获得最后一个符合正则表达式的结果 用来截取歌词文本
        NSTextCheckingResult *lastResult = [allCheckingResults lastObject];
        NSString *lrcStr = [line substringFromIndex:(lastResult.range.location + lastResult.range.length)];
        
        //2.创建模型
        for (NSTextCheckingResult *checkingResult in allCheckingResults) {
            //获取时间字符串并且改成时长
            NSString *timeStr = [line substringWithRange:checkingResult.range];
            //创建模型并初始化，将模型放入数组中
            
            MusicLrc *lrc = [[MusicLrc alloc] init];
            //歌词
            lrc.text = lrcStr;
            
            NSLog(@"strTime= %@  strText = %@",timeStr,lrcStr);
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            //进行日期格式化
            formatter.dateFormat = @"[mm:ss.SS]";
            NSDate *realDate = [formatter dateFromString:timeStr];
            NSDate *zeroDate = [formatter dateFromString:@"[00:00.00]"];
            
            lrc.time = [realDate timeIntervalSinceDate:zeroDate];
            
            [resultArray addObject:lrc];
        }
        
    }
    //3. 将结果进行排序
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"time" ascending:YES];
    
    return [resultArray sortedArrayUsingDescriptors:@[sort]];
}

@end

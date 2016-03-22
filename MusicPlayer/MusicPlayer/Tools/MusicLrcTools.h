//
//  MusicLrcTools.h
//  MusicPlayer
//
//  Created by  justinchou on 16/3/21.
//  Copyright © 2016年  justinchou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicLrcTools : NSObject
/// 获取歌词数组
///
/// @param lrcName 歌词文件名
///
/// @return 歌词数组
+ (NSArray *)arrayOfLrcLinesWithName:(NSString *)lrcName;

@end

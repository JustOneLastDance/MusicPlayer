//
//  MusicLrc.h
//  MusicPlayer
//
//  Created by  justinchou on 16/3/21.
//  Copyright © 2016年  justinchou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicLrc : NSObject
/// 歌词
@property (nonatomic, copy) NSString *text;
/// 歌词出现时间
@property (nonatomic, assign) NSTimeInterval time;

@end

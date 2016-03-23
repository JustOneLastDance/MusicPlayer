//
//  MusicTools.h
//  MusicPlayer
//
//  Created by  justinchou on 16/3/21.
//  Copyright © 2016年  justinchou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface MusicTools : NSObject
/// 播放器属性
@property (nonatomic, strong) AVAudioPlayer *player;
/// 单例
+ (instancetype)sharedTools;
/// 播放
///
/// @param musicName 音乐文件路径
- (void)playWithName:(NSString *)musicName;
/// 暂停
- (void)pause;
/// 歌曲总长
- (NSString *)totalTime;
/// 当前时间
- (NSString *)currentTimeOfMusic;
/// 进度条
- (float)progressOfMusic;
/// 以NSTimeInterval获取当前歌曲时间
- (NSTimeInterval)currentTimeFloatOfMusic;
@end

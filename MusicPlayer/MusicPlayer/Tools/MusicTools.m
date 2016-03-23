//
//  MusicTools.m
//  MusicPlayer
//
//  Created by  justinchou on 16/3/21.
//  Copyright © 2016年  justinchou. All rights reserved.
//

#import "MusicTools.h"

@interface MusicTools()

@property (nonatomic, copy) NSString *currentMusicName;

@end

@implementation MusicTools

+ (instancetype)sharedTools {
    static MusicTools *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [MusicTools new];
    });
    return instance;
}

- (void)playWithName:(NSString *)musicName{
    if (musicName == nil) {
        return;
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:musicName ofType:nil];
    
    if (path == nil) {
        return;
    }
    
    NSURL *url = [NSURL fileURLWithPath:path];
    //如果是当前音乐不从头开始，直接继续播放
    if (![self.currentMusicName isEqualToString:musicName]) {
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        self.currentMusicName = musicName;
    }
    
    [self.player prepareToPlay];
    [self.player play];
}

- (void)pause{
    if ([self.player isPlaying]) {
        [self.player pause];
    }
}

- (NSString *)totalTime {
    NSTimeInterval duration = self.player.duration;
    
    int min = duration / 60;
    int sec = (int)duration % 60;
    
    return [NSString stringWithFormat:@"%02d:%02d", min, sec];
}

- (NSTimeInterval)currentTimeFloatOfMusic {
    return self.player.currentTime;
}

- (NSString *)currentTimeOfMusic{
    NSTimeInterval curr = self.player.currentTime;
    
    int min = curr / 60;
    int sec = (int)curr % 60;
    
    return [NSString stringWithFormat:@"%02d:%02d", min, sec];
}

- (float)progressOfMusic {
    return self.player.currentTime / self.player.duration;
}

@end

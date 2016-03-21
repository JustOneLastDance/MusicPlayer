//
//  Music.h
//  MusicPlayer
//
//  Created by  justinchou on 16/3/21.
//  Copyright © 2016年  justinchou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Music : NSObject
/// 歌名
@property (nonatomic, copy) NSString *name;
/// 专辑图片
@property (nonatomic, copy) NSString *image;
/// 歌词
@property (nonatomic, copy) NSString *lcr;
/// 歌曲文件名
@property (nonatomic, copy) NSString *mp3;
/// 歌手名字
@property (nonatomic, copy) NSString *singer;
/// 专辑名称
@property (nonatomic, copy) NSString *zhuanji;
/// 类型
@property (nonatomic, strong) NSNumber *type;

@end

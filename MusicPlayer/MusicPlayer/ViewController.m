//
//  ViewController.m
//  MusicPlayer
//
//  Created by  justinchou on 16/3/21.
//  Copyright © 2016年  justinchou. All rights reserved.
//

#import "ViewController.h"
#import "Music.h"
#import <MJExtension/MJExtension.h>
#import "MusicTools.h"

@interface ViewController ()
/// 背景图片
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
/// 播放按钮
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
/// 暂停按钮
@property (weak, nonatomic) IBOutlet UIButton *pauseBtn;
/// 进度条
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
/// 当前时间
@property (weak, nonatomic) IBOutlet UILabel *currentTime;
/// 总时间
@property (weak, nonatomic) IBOutlet UILabel *totalTime;
/// 专辑名称
@property (weak, nonatomic) IBOutlet UILabel *albumLabel;
/// 歌手名字
@property (weak, nonatomic) IBOutlet UILabel *singerLabel;
/// 专辑封面
@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;
//=========私有属性==========
/// 音乐数组
@property (nonatomic, strong) NSArray *allMusics;
/// 当前播放的音乐的索引值
@property (nonatomic, assign) NSInteger currentMusicIndex;
/// 定时器
@property (nonatomic, strong) NSTimer *mainTimer;

@end

@implementation ViewController

#pragma mark - 懒加载
- (NSArray *)allMusics {
    if (!_allMusics) {
        _allMusics = [Music mj_objectArrayWithFilename:@"mlist.plist"];
    }
    return _allMusics;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.allMusics);
    
    [self setupUI];
    [self setupMusicInfo];
}

#pragma mark - 玻璃效果
- (void)setupUI {
    
    self.progressView.progress = 0.0;
    self.progressView.tintColor = [UIColor orangeColor];
    
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    toolBar.barStyle = UIBarStyleBlack;
    toolBar.translucent = YES;
    //禁止以frame布局，使用自动布局
    toolBar.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.bgImageView addSubview:toolBar];
    
    //VFL
    NSArray *consH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:nil views:@{@"bar":toolBar}];
    NSArray *consV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-|" options:0 metrics:nil views:@{@"bar":toolBar}];

    //addConstraints放多个约束
    [self.bgImageView addConstraints:consH];
    [self.bgImageView addConstraints:consV];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = YES;
}

#pragma mark - 设计界面信息
- (void)setupMusicInfo {

    Music *music = self.allMusics[self.currentMusicIndex];
    
    self.singerLabel.text = music.singer;
    self.albumLabel.text = music.zhuanji;
    
    self.bgImageView.image = [UIImage imageNamed:music.image];
    self.albumImageView.image = [UIImage imageNamed:music.image];
    
    self.title = music.name;
    
    self.totalTime.text = [[MusicTools sharedTools] totalTime];
}

#pragma mark - 音乐控制
/// 下一首
- (IBAction)nextSong:(id)sender {
    self.currentMusicIndex = (self.currentMusicIndex == self.allMusics.count - 1) ? 0 : self.currentMusicIndex + 1 ;
    [self playMusic:nil];
    [self setupMusicInfo];
}

/// 上一首
- (IBAction)preSong:(id)sender {
    self.currentMusicIndex = (self.currentMusicIndex == 0) ? self.allMusics.count - 1 : self.currentMusicIndex - 1;
    [self playMusic:nil];
    [self setupMusicInfo];
}

/// 播放音乐
- (IBAction)playMusic:(id)sender {
    
    self.pauseBtn.hidden = NO;
    self.playBtn.hidden = YES;
    
    Music *music = self.allMusics[self.currentMusicIndex];
    [[MusicTools sharedTools] playWithName:music.mp3];
    if ([self.currentTime.text isEqualToString:@"00:00"]) {
        self.totalTime.text = [[MusicTools sharedTools] totalTime];
    }
    
    self.mainTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateByTimer) userInfo:nil repeats:YES];
    
}
/// 暂停音乐
- (IBAction)pauseMusic:(id)sender {
    self.playBtn.hidden = NO;
    self.pauseBtn.hidden = YES;
    [[MusicTools sharedTools] pause];
    
    [self.mainTimer invalidate];
    self.mainTimer = nil;
}

/// 定时器执行函数
- (void)updateByTimer{
    
    self.currentTime.text = [[MusicTools sharedTools] currentTimeOfMusic];
    self.progressView.progress = [[MusicTools sharedTools] progressOfMusic];
}


@end

//
//  ViewController.m
//  MusicPlayer
//
//  Created by  justinchou on 16/3/21.
//  Copyright © 2016年  justinchou. All rights reserved.
//

#import "ViewController.h"
#import "Music.h"

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
@property (weak, nonatomic) IBOutlet UIImageView *albumImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    
#pragma mark - 玻璃效果
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

#pragma mark - 音乐控制
/// 播放音乐
- (IBAction)playMusic:(id)sender {
}
/// 暂停音乐
- (IBAction)pauseMusic:(id)sender {
}
/// 下一首
- (IBAction)nextSong:(id)sender {
}
/// 上一首
- (IBAction)preSong:(id)sender {
}



@end

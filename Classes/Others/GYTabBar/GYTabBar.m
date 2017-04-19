//
//  GYTabBar.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/16.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "GYTabBar.h"
#import <UIImageView+WebCache.h>
#import "GYAVPlayerViewController.h"


#define ButtonNumber 5

@interface GYTabBar()<CAAnimationDelegate>

@end

@implementation GYTabBar

{
    GYTabBarButton *_centerPlayBarButton;
    BOOL _isPlay;
    NSInteger _isRotation;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        GYTabBarButton *button = [GYTabBarButton centerButton];
        //中间button的frame
        CGRect btnImageFrame = button.imageView.frame;
        //上部shadow的y
        CGFloat topShadow_Y = 10;
        //上部shadow的宽
        CGFloat playShadow_Width = btnImageFrame.size.width - topShadow_Y * 2;
        //上部shadow的x
        CGFloat playShadow_X = (btnImageFrame.size.width - playShadow_Width)/2;
        //播放按钮上部阴影
        UIImageView *topShadowView = [[UIImageView alloc] initWithFrame:CGRectMake(playShadow_X, topShadow_Y, playShadow_Width,playShadow_Width)];
        topShadowView.image = [UIImage imageNamed:@"tabbar_np_playshadow"];
        
        //播放按钮下部阴影
        //宽
        CGFloat bottomShadow_Width = btnImageFrame.size.width+9.3;
        CGFloat bottomShadow_X = (Screen_Width - bottomShadow_Width)/2;

        UIImageView *bottomShadow = [[UIImageView alloc] initWithFrame:CGRectMake(bottomShadow_X,-18.6, bottomShadow_Width, bottomShadow_Width)];
        
        bottomShadow.image = [UIImage imageNamed:@"tabbar_np_shadow"];
        
        _playImageView = [[UIImageView alloc] initWithFrame:CGRectMake(playShadow_X + 1, 12, playShadow_Width - 2 , playShadow_Width - 2)];
        _playImageView.layer.cornerRadius = (playShadow_Width - 2)/2;
        _playImageView.layer.masksToBounds = YES;
        _playImageView.image = [UIImage imageNamed:@""];
        
        _playAndStopBtn = [[UIButton alloc] initWithFrame:CGRectMake(playShadow_X - 1, 9, playShadow_Width + 2, playShadow_Width + 2)];
        
        [_playAndStopBtn setImage:[UIImage imageNamed:@"tabbar_np_play"] forState:UIControlStateNormal];
        
        [_playAndStopBtn addTarget:self action:@selector(playOrStopAction:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:button];
        [self addSubview:bottomShadow];
        [button addSubview:_playImageView];
        [button addSubview:topShadowView];
        //最顶层按钮
        [button addSubview:_playAndStopBtn];
        
        _centerPlayBarButton = button;
        
        [self addNSNotification];
        
    }
    return self;
}

- (void)addNSNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getImage:) name:@"HomeVCCenterImage" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isPlayOrPause:) name:@"isPlayOrPause" object:nil];
}

- (void)isPlayOrPause:(NSNotification *)notification{
    
    if ([notification.userInfo[@"rate"] floatValue] != 1.0f)
    {
        [_playAndStopBtn setImage:[UIImage imageNamed:@"tabbar_np_play"] forState:UIControlStateNormal];
        _isPlay = NO;
        
        [self rotateStopActionWithView:_playImageView];
            
    }
    else{
        [_playAndStopBtn setImage:[UIImage imageNamed:@"toolbar_pause_n"] forState:UIControlStateNormal];
            _isPlay = YES;
        
        [self rotateActionWithView:_playImageView];
    }
    
    
    
}


- (void)getImage:(NSNotification *)notification{
    
    GYAVPlayerViewController *playerVC = [GYAVPlayerViewController shareInstance];
    
    NSString *picUrlString = notification.userInfo[@"coverSmall"];
    
    [_playImageView sd_setImageWithURL:[NSURL URLWithString:picUrlString]];
    
    if (playerVC.player.rate != 1.0f)
    {
        [_playAndStopBtn setImage:[UIImage imageNamed:@"tabbar_np_play"] forState:UIControlStateNormal];
        [self rotateStopActionWithView:_playImageView];
    }
    else
    {
        [_playAndStopBtn setImage:[UIImage imageNamed:@"toolbar_pause_n"] forState:UIControlStateNormal];
        [self rotateActionWithView:_playImageView];
        
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)playOrStopAction:(UIButton *)sender{
    
    GYAVPlayerViewController *playerVC = [GYAVPlayerViewController shareInstance];
    
    if (!_isPlay)
    {
        [_playAndStopBtn setImage:[UIImage imageNamed:@"tabbar_np_play"] forState:UIControlStateNormal];
        [playerVC.player pause];
        [self rotateStopActionWithView:_playImageView];
    }
    else
    {
        [_playAndStopBtn setImage:[UIImage imageNamed:@"toolbar_pause_n"] forState:UIControlStateNormal];
        [playerVC.player play];
        
        [self rotateActionWithView:_playImageView];
    }

    _isPlay = !_isPlay;
    
}

- (void)rotateActionWithView:(UIImageView *)imageView{
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = @(0);
    rotation.toValue = @(M_PI * 2);
    rotation.duration = 10;
    rotation.repeatCount = MAXFLOAT;
    //控制运动节奏
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    rotation.delegate = self;
    //延时  CACurrentMediaTime()为图层当前的时间
    //    rotation.beginTime = CACurrentMediaTime() + 2;
    
    rotation.fillMode = kCAFillModeForwards;
    //如果一个动画是CAAnimation，需要将removedOnCompletion设置成NO，否则fillMode不起作用
    rotation.removedOnCompletion = NO;
    [imageView.layer addAnimation:rotation forKey:nil];
}

- (void)rotateStopActionWithView:(UIImageView *)imageView{
    
    [imageView.layer removeAllAnimations];
}




-(void)layoutSubviews{
    
    
    NSLog(@"%s",__func__);
    
    [super layoutSubviews];
    
    CGFloat barWidth = self.frame.size.width;
    CGFloat barHeight = self.frame.size.height;
    
    CGFloat buttonW = barWidth / ButtonNumber;
    CGFloat buttonH = barHeight - 2;
    CGFloat buttonY = 1;
    
    NSInteger buttonIndex = 0;
    
    _centerPlayBarButton.center = CGPointMake(barWidth * 0.5, barHeight * 0.35);
    
    for (UIView *view in self.subviews) {
        
        NSString *viewClass = NSStringFromClass([view class]);
        if (![viewClass isEqualToString:@"UITabBarButton"]) continue;
        
        CGFloat buttonX = buttonIndex * buttonW;
        if (buttonIndex >= 2) { // 右边2个按钮
            buttonX += buttonW;
        }
        
        view.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        
        buttonIndex ++;
        
        
    }
}






















@end

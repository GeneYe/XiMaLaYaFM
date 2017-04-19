//
//  AVPlayerTopView.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/22.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackInfoModel.h"

@protocol AVPlayerTopViewDelegate <NSObject>

@required
//开始停止
- (void)startAndStopBtnAction:(UIButton *)sender;
//下一首音乐
- (void)nextSoundBtnAction:(UIButton *)sender;
//上一首音乐
- (void)lastSoundBtnAction:(UIButton *)sender;
//silder值的改变
- (void)sliderValueChangeSliderAction:(id)sender;
//touch slider
- (void)sliderTouchInsideAction:(UISlider *)sender;

@end

@interface AVPlayerTopView : UIView

@property (nonatomic,weak) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UIImageView *coverPathImageView;
@property (weak, nonatomic) IBOutlet UIButton *StartAndEndBtn;
@property (weak, nonatomic) IBOutlet UIButton *lastSoundBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextSoundBtn;
@property (weak, nonatomic) IBOutlet UILabel *totalDuration;
@property (weak, nonatomic) IBOutlet UILabel *currentTime;
@property (weak, nonatomic) IBOutlet UISlider *playerSilder;
@property (weak, nonatomic) IBOutlet UIProgressView *progressStatus;

@property (weak, nonatomic) IBOutlet UIImageView *loadingImageView;
@property (nonatomic,strong)TrackInfoModel *model;


@property (nonatomic,weak) id<AVPlayerTopViewDelegate> delegate;

+ (instancetype)initCustomViewWithFrame:(CGRect)frame;








@end

//
//  AVPlayerTopView.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/22.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "AVPlayerTopView.h"

@implementation AVPlayerTopView

+ (instancetype)initCustomViewWithFrame:(CGRect)frame{
    
    AVPlayerTopView *view = [[[NSBundle mainBundle] loadNibNamed:@"AVPlayerTopView" owner:nil options:nil] objectAtIndex:0];
    
    view.coverPathImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    view.tag = 1000;
    
    view.frame = frame;
    
    [view.coverPathImageView setClipsToBounds:YES];
    

    return view;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        
        [self creatView];
    }
    return self;
}

- (void)creatView{
    [[NSBundle mainBundle] loadNibNamed:@"AVPlayerTopView" owner:self options:nil];
    self.view.frame = self.bounds;
    [self addSubview:self.view];
}



- (IBAction)startAndStopAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(startAndStopBtnAction:)]) {
        [self.delegate startAndStopBtnAction:sender];
        NSLog(@"开始或者结束");
    }
    
}
- (IBAction)nextSoundAction:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(nextSoundBtnAction:)]) {
        [self.delegate nextSoundBtnAction:sender];
    }
}

- (IBAction)lastSoundAction:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(lastSoundBtnAction:)]) {
        [self.delegate lastSoundBtnAction:sender];
    }
}
- (IBAction)sliderValueChangeAction:(UISlider *)sender {
    
    if ([self.delegate respondsToSelector:@selector(sliderValueChangeSliderAction:)]) {
        [self.delegate sliderValueChangeSliderAction:sender];
    }
}

- (IBAction)slidertouchInside:(UISlider *)sender {
    if ([self.delegate respondsToSelector:@selector(sliderTouchInsideAction:)]) {
        [self.delegate sliderValueChangeSliderAction:sender];
    }

}












@end

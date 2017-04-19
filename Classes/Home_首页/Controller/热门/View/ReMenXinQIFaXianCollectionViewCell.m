//
//  ReMenXinQIFaXianCollectionViewCell.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/17.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "ReMenXinQIFaXianCollectionViewCell.h"
#import "ReMenFenXiangViewController.h"
#import "JinRiZuiHuoViewController.h"
#import "JingDianBiTingViewController.h"
#import "YiJianZiXunViewController.h"
#import "JingPinTingDanRootViewController.h"
#import "FuFeiJingPinViewController.h"
#import "TingGuangBoViewController.h"
#import "TingMouGeQiQuViewController.h"
#import <UIImageView+WebCache.h>

#import "GYAVPlayerViewController.h"

@interface ReMenXinQIFaXianCollectionViewCell ()

@property (nonatomic,strong)NSDictionary *dic;

@end

@implementation ReMenXinQIFaXianCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];

        scrollView.showsHorizontalScrollIndicator = NO;
        
        CGFloat btnHeight = self.RL_Height;
        CGFloat btnwidth = Screen_Width / 4.5;
        CGFloat itemNum = 8;
        scrollView.contentSize = CGSizeMake(btnwidth * itemNum, 0);
        
        [self addSubview:scrollView];
        
        for (int i = 0; i < itemNum; i++) {
            self.faXianBtn = [ReMenXinQiFaXianButton initCustomWithFrame:CGRectMake(btnwidth * i, 0, btnwidth, btnHeight)];
            self.faXianBtn.tag = 100+i;
            
            [self.faXianBtn addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchDown];
            [scrollView addSubview:self.faXianBtn];
        }
    }
    return self;
}

- (void)setList:(NSArray *)list{
    
    for (int i = 0; i < list.count; i++) {
        GYOthersList *otherList = list[i];
        
        ReMenXinQiFaXianButton *btn = [self viewWithTag:100+i];
        
        [btn.XinQiFaXianBtnImageView sd_setImageWithURL:[NSURL URLWithString:otherList.coverPath]];
        
        btn.XinQiFaXianBtnTitle.text = otherList.title;
        
        
    }
}

- (void)pushAction:(UIButton *)sender{
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotification:) name:@"JingPinTuiJianTongZhi" object:nil];
    switch (sender.tag - 100) {
        case 0:{
            JingDianBiTingViewController *VC = [JingDianBiTingViewController new];
            _dic = @{@"VC":VC};
        }
            break;
        case 1:{
           FuFeiJingPinViewController *VC = [FuFeiJingPinViewController new];
           // GYAVPlayerViewController *VC = [GYAVPlayerViewController new];
            _dic = @{@"VC":VC};
        }
            break;
        case 2:{
            TingGuangBoViewController *VC = [TingGuangBoViewController new];
            _dic = @{@"VC":VC};
        }
            break;
        case 3:
        {
            TingMouGeQiQuViewController *VC = [TingMouGeQiQuViewController new];
            
            _dic = @{@"VC":VC};
            
        }
            break;
        case 4:{
            JinRiZuiHuoViewController *VC = [JinRiZuiHuoViewController new];
            _dic = @{@"VC":VC};
        }
            break;
        case 5:{
            YiJianZiXunViewController *VC = [YiJianZiXunViewController new];
            _dic = @{@"VC":VC};
        }
            break;
        case 6:
        {
            ReMenFenXiangViewController *VC = [ReMenFenXiangViewController new];
            
            _dic = @{@"VC":VC};
        }
            break;
        case 7:{
            JingPinTingDanRootViewController *VC = [JingPinTingDanRootViewController new];
            
            _dic = @{@"VC":VC};
            
        }
            break;
        default:
            break;
    }
    
        [[NSNotificationCenter defaultCenter] postNotificationName:@"VCWitchWillBePushed" object:nil userInfo:_dic];

    

}
















@end

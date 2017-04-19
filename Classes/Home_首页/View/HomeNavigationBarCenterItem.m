//
//  HomeNavigationBarCenterItem.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/18.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "HomeNavigationBarCenterItem.h"

@implementation HomeNavigationBarCenterItem


+ (instancetype)initCustomSearchButtonWithFrame:(CGRect)frame{
    
    HomeNavigationBarCenterItem *button = [[[NSBundle mainBundle] loadNibNamed:@"HomeNavigationBarCenterItem" owner:nil options:nil] objectAtIndex:0];
    
    button.layer.cornerRadius = 15.0;
    button.layer.masksToBounds = YES;
    
    button.frame = frame;
    
    return button;
}



@end

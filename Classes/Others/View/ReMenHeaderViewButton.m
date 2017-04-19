//
//  ReMenHeaderViewButton.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/17.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "ReMenHeaderViewButton.h"

@implementation ReMenHeaderViewButton

+(instancetype)initCustomHeaderButtonWithFrame:(CGRect)frame{
    
    ReMenHeaderViewButton *btn = [[[NSBundle mainBundle] loadNibNamed:@"ReMenHeaderViewButton" owner:nil options:nil] objectAtIndex:0];
    
    btn.frame = frame;
    
    return btn;
}

@end

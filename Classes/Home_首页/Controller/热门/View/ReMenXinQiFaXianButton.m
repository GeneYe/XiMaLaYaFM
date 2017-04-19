//
//  ReMenXinQiFaXianButton.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/17.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "ReMenXinQiFaXianButton.h"

@implementation ReMenXinQiFaXianButton

+ (instancetype)initCustomWithFrame:(CGRect)frame{
    
    ReMenXinQiFaXianButton *btn = [[[NSBundle mainBundle] loadNibNamed:@"ReMenXinQiFaXianButton" owner:nil options:nil] objectAtIndex:0];
    
    btn.frame = frame;
    
    return btn;
}

@end

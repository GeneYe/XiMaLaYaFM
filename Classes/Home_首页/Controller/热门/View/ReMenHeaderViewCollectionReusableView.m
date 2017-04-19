//
//  ReMenHeaderViewCollectionReusableView.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/17.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "ReMenHeaderViewCollectionReusableView.h"

@implementation ReMenHeaderViewCollectionReusableView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)setTitleString:(NSString *)titleString{
    
    ReMenHeaderViewButton *btn = [ReMenHeaderViewButton initCustomHeaderButtonWithFrame:self.bounds];
    
    btn.reMenHeaderViewTitleLabel.text = titleString;
    
    btn.tag = 200;
    
    [self addSubview:btn];
    
}

@end

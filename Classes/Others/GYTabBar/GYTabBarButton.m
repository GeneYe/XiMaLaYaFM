//
//  GYTabBarButton.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/16.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "GYTabBarButton.h"

//图片比率
#define ImageRatio 0.8

@implementation GYTabBarButton

//上下结构的button
- (void)layoutSubviews
{
    [super layoutSubviews];
    //空间大小，间距
    CGFloat const imageViewEdge = self.bounds.size.width;
    CGFloat const centerOfView = self.bounds.size.width ;
    
    //imageView中心的 Y 值
    CGFloat centerOfImageViewY = imageViewEdge * 0.5;
    
    //imageView postion
    self.imageView.bounds = CGRectMake(centerOfView, centerOfImageViewY, imageViewEdge,imageViewEdge );
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}


+(instancetype)centerButton{
    
    GYTabBarButton *button = [[GYTabBarButton alloc] init];
    
    [button setImage:[UIImage imageNamed:@"tabbar_np_normal"] forState:UIControlStateNormal];
    
    [button sizeToFit];
    
    return button;
    
}
























@end

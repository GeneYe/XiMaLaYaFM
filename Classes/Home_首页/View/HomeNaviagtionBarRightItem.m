//
//  HomeNaviagtionBarRightItem.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/18.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "HomeNaviagtionBarRightItem.h"

@implementation HomeNaviagtionBarRightItem

+(instancetype)initWithCustomRightItemWithFrame:(CGRect)frame Image:(NSString *)imageName{
    
    HomeNaviagtionBarRightItem *item = [[[NSBundle mainBundle] loadNibNamed:@"HomeNaviagtionBarRightItem" owner:nil options:nil] objectAtIndex:0];
    
    item.backgroundImageView.image = [UIImage imageNamed:imageName];
    
    item.frame = frame;
    
    return item;
}


@end

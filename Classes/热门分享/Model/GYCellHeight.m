//
//  GYCellHeight.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/20.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "GYCellHeight.h"

@implementation GYCellHeight

- (CGFloat)cellHeight{
    
    if (!_cellHeight) {
        CGFloat contentH = [self.content boundingRectWithSize:CGSizeMake(Screen_Width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:_fontSize]} context:nil].size.height;
        
        _cellHeight = contentH;
    }
    return _cellHeight;
    
    
}

@end

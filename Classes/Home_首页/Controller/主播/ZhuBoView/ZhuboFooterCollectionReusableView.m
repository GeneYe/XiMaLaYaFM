//
//  ZhuboFooterCollectionReusableView.m
//  喜马拉雅FM
//
//  Created by 李东 on 16/11/21.
//  Copyright © 2016年 李东. All rights reserved.
//

#import "ZhuboFooterCollectionReusableView.h"

@implementation ZhuboFooterCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.backgroundColor = GYColor(241, 241, 241).CGColor;
    
}

@end

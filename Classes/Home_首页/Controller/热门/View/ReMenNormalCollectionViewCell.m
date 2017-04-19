//
//  ReMenNormalCollectionViewCell.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/17.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "ReMenNormalCollectionViewCell.h"
#import <UIImageView+WebCache.h>

@implementation ReMenNormalCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)setList:(GYList *)list{
    
    [_coverImageView sd_setImageWithURL:[NSURL URLWithString:list.coverLarge]];
    
    _trackTitle.text = list.trackTitle;
    
    _title.text = list.title;
}

- (void)setOtherlist:(GYOthersList *)Otherlist{
    
    [_coverImageView sd_setImageWithURL:[NSURL URLWithString:Otherlist.coverLarge]];
    
    _trackTitle.text = Otherlist.trackTitle;
    
    _title.text = Otherlist.title;
}

@end

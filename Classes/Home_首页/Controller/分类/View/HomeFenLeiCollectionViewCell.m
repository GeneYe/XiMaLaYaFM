//
//  HomeFenLeiCollectionViewCell.m
//  Himalayas_FM
//
//  Created by Jimuta_NI on 16/11/15.
//  Copyright © 2016年 Jimuta_NI. All rights reserved.
//

#import "HomeFenLeiCollectionViewCell.h"
#import <UIImageView+WebCache.h>
@implementation HomeFenLeiCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setHomeFenLeiListModel:(HomeFenLeiList *)homeFenLeiListModel{
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:homeFenLeiListModel.coverPath]];
    _titleLabel.text = homeFenLeiListModel.title;
}
@end

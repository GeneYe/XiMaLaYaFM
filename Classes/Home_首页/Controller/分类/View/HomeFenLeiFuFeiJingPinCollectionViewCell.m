//
//  HomeFenLeiFuFeiJingPinCollectionViewCell.m
//  Himalayas_FM
//
//  Created by Jimuta_NI on 16/11/17.
//  Copyright © 2016年 Jimuta_NI. All rights reserved.
//

#import "HomeFenLeiFuFeiJingPinCollectionViewCell.h"
#import <UIImageView+WebCache.h>
@implementation HomeFenLeiFuFeiJingPinCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setHomeFenLeiJingPinModel:(HomeFenLeiList *)homeFenLeiJingPinModel{
    
    [_coverImgeView sd_setImageWithURL:[NSURL URLWithString:homeFenLeiJingPinModel.coverPath]];
}
@end

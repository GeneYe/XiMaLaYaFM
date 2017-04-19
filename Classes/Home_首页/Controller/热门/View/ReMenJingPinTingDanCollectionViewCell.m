//
//  ReMenJingPinTingDanCollectionViewCell.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/18.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "ReMenJingPinTingDanCollectionViewCell.h"

#import <UIImageView+WebCache.h>

@implementation ReMenJingPinTingDanCollectionViewCell


- (void)setList:(GYList *)list{
    
    [_coverImageView sd_setImageWithURL:[NSURL URLWithString:list.coverPath]];
    
    _title.text = list.title;
    
    _footnote.text = list.footnote;
    
    _subtitle.text = list.subtitle;

}

- (void)setRow:(NSInteger)row{
    if (row == 1) {
        _bottomLine.hidden = YES;
    }
}





@end

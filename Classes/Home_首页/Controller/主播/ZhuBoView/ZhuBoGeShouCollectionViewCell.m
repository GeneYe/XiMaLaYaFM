//
//  ZhuBoGeShouCollectionViewCell.m
//  喜马拉雅FM
//
//  Created by 李东 on 16/11/21.
//  Copyright © 2016年 李东. All rights reserved.
//

#import "ZhuBoGeShouCollectionViewCell.h"
#import <UIImageView+WebCache.h>

@implementation ZhuBoGeShouCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    _smallLogo.layer.cornerRadius = _smallLogo.frame.size.width/2;
    _smallLogo.layer.masksToBounds = YES;
    
    // Initialization code
}

-(void)setList:(List *)list{

    [_smallLogo sd_setImageWithURL:[NSURL URLWithString:list.smallLogo]];
    _nickname.text = list.nickname;
    _verifyTitle.text = list.verifyTitle;

    _tracksCounts.text = [NSString stringWithFormat:@"%.0f",list.tracksCounts];


    
    
    if (list.followersCounts < 10000) {
        
        _followersCounts.text = [NSString stringWithFormat:@"%0f",list.followersCounts];
        
    }
    else{
    
        _followersCounts.text = [NSString stringWithFormat:@"%.1f万",list.followersCounts/10000];
    }
    
    
}













@end

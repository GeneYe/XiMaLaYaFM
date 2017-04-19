//
//  FamousCollectionViewCell.m
//  喜马拉雅FM
//
//  Created by 李东 on 16/11/21.
//  Copyright © 2016年 李东. All rights reserved.
//

#import "FamousCollectionViewCell.h"
#import <UIImageView+WebCache.h>

@implementation FamousCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.topBGView.layer.borderWidth = 1;
    self.topBGView.layer.borderColor = GYColor(192, 173, 141).CGColor;
    
    // Initialization code
}

-(void)setList:(List *)list{

    [_smallLogo sd_setImageWithURL:[NSURL URLWithString:list.largeLogo]];
    _nickname.text = list.nickname;
    _verifyTitle.text = list.verifyTitle;
    
    if (list.verifyTitle == nil) {
        
        _verifyTitle.text = list.personDescribe;
        
    }

}


@end

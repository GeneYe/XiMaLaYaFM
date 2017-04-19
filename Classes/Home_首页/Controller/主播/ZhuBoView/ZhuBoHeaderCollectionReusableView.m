//
//  ZhuBoHeaderCollectionReusableView.m
//  喜马拉雅FM
//
//  Created by 李东 on 16/11/21.
//  Copyright © 2016年 李东. All rights reserved.
//

#import "ZhuBoHeaderCollectionReusableView.h"
#import "ZhuBoAAAViewController.h"

@implementation ZhuBoHeaderCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];

    
}

-(void)setFamous:(Famous *)famous{

    _title.text = famous.title;

}

-(void)setNormal:(Normal *)normal{

    _title.text = normal.title;

}
- (IBAction)BtnAction:(UIButton *)sender {
    
//    ZhuBoAAAViewController *zhuBoAAA = [ZhuBoAAAViewController new];
//    [self ]
    
    
}

@end

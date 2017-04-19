//
//  RemMenTopGunDongCollectionReusableView.m
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/17.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "RemMenTopGunDongCollectionReusableView.h"
#import "DataModels.h"

@implementation RemMenTopGunDongCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setBannerTopImageArray:(NSMutableArray *)bannerTopImageArray{
    
    NSMutableArray *mArray = [NSMutableArray array];
    
    for (int i = 0; i < bannerTopImageArray.count; i++) {
        GYList *list = bannerTopImageArray[i];
        [mArray addObject:list.pic];
    }

    _scrollPic = [[RLScrollPic alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Width/2.13) WithImageName:mArray];
    
    [_reMenGuangGaoScrollView addSubview:_scrollPic];
}




@end

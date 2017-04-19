//
//  RemMenTopGunDongCollectionReusableView.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/17.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RLScrollPic.h"
#import "DataModels.h"

@interface RemMenTopGunDongCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIView *reMenGuangGaoScrollView;

@property (nonatomic,strong)RLScrollPic *scrollPic;
//顶部广告图片数组
@property (nonatomic,strong)NSMutableArray *bannerTopImageArray;
//底部滚动按钮

@property (nonatomic,strong)GYList *list;
@end

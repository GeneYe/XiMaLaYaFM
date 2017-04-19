//
//  ReMenJingPinTingDanCollectionViewCell.h
//  XiMaLaYaFM
//
//  Created by Gene_Ye on 2016/11/18.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"

@interface ReMenJingPinTingDanCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong)GYList *list;

@property (nonatomic,assign)NSInteger row;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *footnote;

@property (weak, nonatomic) IBOutlet UIImageView *bottomLine;

//+ (instancetype)initWithCustomButtonWithFrame:(CGRect)frame;

@end
